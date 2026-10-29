import AST
import Foundation

/// A policy's `decision` document: `{"deny": [...], "warn": [...], "note": [...]}`.
struct PolicyDecision: Decodable {
    let deny: [Entry]
    let warn: [Entry]
    let note: [Entry]

    init(deny: [Entry], warn: [Entry], note: [Entry]) {
        self.deny = deny
        self.warn = warn
        self.note = note
    }

    struct Entry: Decodable {
        let ruleID: String
        let message: String
        let line: Int
        let column: Int

        enum CodingKeys: String, CodingKey {
            case ruleID = "rule_id"
            case message
            case line
            case column
        }
    }

    /// Decodes the value of one query result (`{"result": <decision>}`).
    init(result: AST.RegoValue) throws {
        guard case .object(let bindings) = result, case .object(let decision)? = bindings["result"] else {
            throw UnexpectedResult(result: result)
        }
        let isEmpty = ["deny", "warn", "note"].allSatisfy { key in
            if case .array(let entries)? = decision[.string(key)] { return entries.isEmpty }
            return decision[.string(key)] == nil
        }
        if isEmpty {
            self.init(deny: [], warn: [], note: [])
        } else {
            self = try JSONDecoder().decode(Self.self, from: JSONEncoder().encode(AST.RegoValue.object(decision)))
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
        "policy decision is not a {\"result\": decision} object: \(result)"
    }
}
