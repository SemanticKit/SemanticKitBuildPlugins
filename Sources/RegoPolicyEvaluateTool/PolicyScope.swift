import Foundation

/// The syntax node types a policy can find something in, read from its plan.
///
/// In a plan, every rule body takes `input` as local 0. A body such as
///
/// ```rego
/// call := input
/// call.type == "FunctionCallExprSyntax"
/// ```
///
/// fails for every node of another type, so it finds nothing there. When
/// every body that reads `input` starts with such a type test, a node of a
/// type none of them names gets the same decision as any other such node,
/// and the policy only has to see the nodes of the types it names. A body
/// that reads `input` in any other way first, or passes it anywhere but to
/// the plan's own rule functions, gives the policy every node (`nodeTypes`
/// is `nil`).
struct PolicyScope: Equatable {
    /// The node types the type tests name; `nil` for every node.
    let nodeTypes: Set<String>?

    init(plan: Data) throws {
        guard let root = try JSONSerialization.jsonObject(with: plan) as? [String: Any] else {
            throw NotAPlan()
        }
        let strings = ((root["static"] as? [String: Any])?["strings"] as? [[String: Any]] ?? [])
            .map { $0["value"] as? String ?? "" }
        let functions = ((root["funcs"] as? [String: Any])?["funcs"] as? [[String: Any]]) ?? []
        let plans = ((root["plans"] as? [String: Any])?["plans"] as? [[String: Any]]) ?? []
        let reading = BodyReading(
            strings: strings,
            functionNames: Set(functions.compactMap { $0["name"] as? String })
        )

        var nodeTypes = Set<String>()
        for body in (functions + plans).flatMap({ $0["blocks"] as? [[String: Any]] ?? [] }) {
            switch reading.kind(of: body) {
            case .independent:
                continue
            case .typeTested(let types):
                nodeTypes.formUnion(types)
            case .unscoped:
                self.nodeTypes = nil
                return
            }
        }
        self.nodeTypes = nodeTypes
    }

    init(nodeTypes: Set<String>?) {
        self.nodeTypes = nodeTypes
    }
}

/// How one block of a plan reads `input`.
private struct BodyReading {
    enum Kind {
        /// The block does not read `input`.
        case independent
        /// The block, or each block nested in it that reads `input`, reads it
        /// only after testing `input.type` against one of `types`.
        case typeTested(Set<String>)
        /// The block reads `input` before, or without, a type test.
        case unscoped
    }

    let strings: [String]
    let functionNames: Set<String>

    /// Fields of a statement that hold positions, string indices or literals
    /// rather than locals.
    private static let nonLocalFields: Set<String> = [
        "file", "col", "row", "end_col", "end_row", "index", "Index", "capacity", "func", "type",
    ]

    /// Statements whose `value` is an integer literal rather than a local.
    private static let integerLiteralStatements: Set<String> = ["MakeNumberIntStmt", "AssignIntStmt"]

    /// The locals of a block that hold `input` (`aliases`), a value read
    /// from it (`derived`, which includes `aliases`), or `input.type`
    /// (`typeLocals`). A nested block shares them with the block around it.
    private struct Locals {
        var aliases: Set<Int> = [0]
        var derived: Set<Int> = [0]
        var typeLocals: Set<Int> = []
    }

    func kind(of block: [String: Any]) -> Kind {
        var locals = Locals()
        return kind(of: block, &locals)
    }

    private func kind(of block: [String: Any], _ locals: inout Locals) -> Kind {
        var readsInput = false
        var nestedTypes = Set<String>()

        for statement in block["stmts"] as? [[String: Any]] ?? [] {
            let type = statement["type"] as? String ?? ""
            let fields = statement["stmt"] as? [String: Any] ?? [:]
            switch type {
            case "ResetLocalStmt":
                continue
            case "IsDefinedStmt":
                // `input` itself is always defined; a value read from it may not be.
                let source = fields["source"] as? Int
                readsInput = readsInput || (source.map(locals.aliases.contains) != true && source.map(locals.derived.contains) == true)
                continue
            case "AssignVarStmt" where Self.local(fields["source"]).map(locals.derived.contains) == true:
                guard let target = fields["target"] as? Int else { return .unscoped }
                locals.derived.insert(target)
                if Self.local(fields["source"]).map(locals.aliases.contains) == true {
                    locals.aliases.insert(target)
                }
                if Self.local(fields["source"]).map(locals.typeLocals.contains) == true {
                    locals.typeLocals.insert(target)
                }
                continue
            case "DotStmt" where Self.local(fields["source"]).map(locals.derived.contains) == true:
                guard let target = fields["target"] as? Int else { return .unscoped }
                locals.derived.insert(target)
                // Every node has a `type`, so reading it is no test of the node.
                if Self.local(fields["source"]).map(locals.aliases.contains) == true, stringConstant(fields["key"]) == "type" {
                    locals.typeLocals.insert(target)
                } else {
                    readsInput = true
                }
                continue
            case "EqualStmt":
                if let a = Self.local(fields["a"]), locals.typeLocals.contains(a), let type = stringConstant(fields["b"]) {
                    return readsInput ? .unscoped : .typeTested(nestedTypes.union([type]))
                }
                if let b = Self.local(fields["b"]), locals.typeLocals.contains(b), let type = stringConstant(fields["a"]) {
                    return readsInput ? .unscoped : .typeTested(nestedTypes.union([type]))
                }
            case "BlockStmt":
                // The blocks of a comprehension: each finds nothing in a node
                // of a type it does not test for, so the block around goes on
                // with the same value for all of them.
                for nested in fields["blocks"] as? [[String: Any]] ?? [] {
                    switch kind(of: nested, &locals) {
                    case .independent:
                        continue
                    case .typeTested(let types):
                        nestedTypes.formUnion(types)
                    case .unscoped:
                        return .unscoped
                    }
                }
                continue
            default:
                break
            }
            if references(statement, locals.derived) {
                return .unscoped
            }
        }
        if readsInput {
            return .unscoped
        }
        return nestedTypes.isEmpty ? .independent : .typeTested(nestedTypes)
    }

    /// Whether `value`, a statement or part of one, uses any of `locals`,
    /// apart from passing `input` and `data` on to one of the plan's own
    /// functions.
    private func references(_ value: Any, _ locals: Set<Int>) -> Bool {
        if let statement = value as? [String: Any], let type = statement["type"] as? String,
           let fields = statement["stmt"] as? [String: Any]
        {
            if type == "CallStmt", isRuleCall(fields, locals) {
                return false
            }
            return fields.contains { key, field in
                guard !Self.nonLocalFields.contains(key) else { return false }
                if Self.integerLiteralStatements.contains(type), key == "value" { return false }
                return references(field, locals)
            }
        }
        if let operand = value as? [String: Any], let type = operand["type"] as? String {
            return type == "local" && (operand["value"] as? Int).map(locals.contains) == true
        }
        if let object = value as? [String: Any] {
            return object.contains { key, field in !Self.nonLocalFields.contains(key) && references(field, locals) }
        }
        if let array = value as? [Any] {
            return array.contains { references($0, locals) }
        }
        if let local = value as? Int {
            return locals.contains(local)
        }
        return false
    }

    /// A call of one of the plan's functions that passes `input` and `data`
    /// as its first two arguments and no read of `input` as any other.
    private func isRuleCall(_ fields: [String: Any], _ locals: Set<Int>) -> Bool {
        guard let name = fields["func"] as? String, functionNames.contains(name),
              let arguments = fields["args"] as? [Any], arguments.count >= 2,
              Self.local(arguments[0]) == 0, Self.local(arguments[1]) == 1
        else {
            return false
        }
        return !arguments.dropFirst(2).contains { references($0, locals) }
    }

    private static func local(_ operand: Any?) -> Int? {
        if let local = operand as? Int { return local }
        guard let operand = operand as? [String: Any], operand["type"] as? String == "local" else { return nil }
        return operand["value"] as? Int
    }

    private func stringConstant(_ operand: Any?) -> String? {
        guard let operand = operand as? [String: Any], operand["type"] as? String == "string_index",
              let index = operand["value"] as? Int, strings.indices.contains(index)
        else {
            return nil
        }
        return strings[index]
    }
}

private struct NotAPlan: Error, CustomStringConvertible {
    var description: String {
        "plan.json is not an OPA plan"
    }
}
