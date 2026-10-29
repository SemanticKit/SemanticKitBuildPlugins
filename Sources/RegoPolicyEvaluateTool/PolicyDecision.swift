import AST

/// A policy's `decision` document: `{"deny": [...], "warn": [...], "note": [...]}`.
///
/// A key the decision leaves out counts as an empty list.
struct PolicyDecision {
    let deny: [Entry]
    let warn: [Entry]
    let note: [Entry]

    struct Entry {
        let ruleID: String
        let message: String
        let line: Int
        let column: Int

        init(_ value: AST.RegoValue) throws {
            guard case .object(let entry) = value,
                  case .string(let ruleID)? = entry["rule_id"],
                  case .string(let message)? = entry["message"],
                  case .number(let line)? = entry["line"],
                  case .number(let column)? = entry["column"]
            else {
                throw UnexpectedResult(result: value)
            }
            self.ruleID = ruleID
            self.message = message
            self.line = line.intValue
            self.column = column.intValue
        }
    }

    /// Decodes the value of one query result (`{"result": <decision>}`).
    init(result: AST.RegoValue) throws {
        guard case .object(let bindings) = result, case .object(let decision)? = bindings["result"] else {
            throw UnexpectedResult(result: result)
        }
        self.deny = try Self.entries(decision["deny"])
        self.warn = try Self.entries(decision["warn"])
        self.note = try Self.entries(decision["note"])
    }

    private static func entries(_ value: AST.RegoValue?) throws -> [Entry] {
        switch value {
        case nil, .undefined?:
            return []
        case .array(let entries)?:
            return try entries.map(Entry.init)
        case .set(let entries)?:
            return try entries.map(Entry.init)
        case let value?:
            throw UnexpectedResult(result: value)
        }
    }

    var findings: [PolicyFinding] {
        deny.map { PolicyFinding($0, level: .error) }
            + warn.map { PolicyFinding($0, level: .warning) }
            + note.map { PolicyFinding($0, level: .note) }
    }
}

private struct UnexpectedResult: Error, CustomStringConvertible {
    let result: AST.RegoValue

    var description: String {
        "policy decision is not a {\"result\": {\"deny\", \"warn\", \"note\"}} object of {rule_id, message, line, column} entries: \(result)"
    }
}
