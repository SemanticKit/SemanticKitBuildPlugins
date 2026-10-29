import AST
import Testing
@testable import RegoPolicyEvaluateTool

@Suite("PolicyDecision", .tags(.diagnostics))
struct PolicyDecisionTests {
    private let entry: AST.RegoValue = [
        "rule_id": "example.rule", "message": "Do not.", "line": 3, "column": 7, "severity": "error",
    ]

    @Test("deny, warn and note entries become error, warning and note findings")
    func levels() throws {
        let decision = try PolicyDecision(result: ["result": ["deny": [entry], "warn": [entry], "note": [entry]]])
        #expect(decision.findings.map(\.level) == [.error, .warning, .note])
        #expect(decision.findings.allSatisfy { $0.ruleID == "example.rule" && $0.message == "Do not." && $0.line == 3 && $0.column == 7 })
    }

    @Test("A key the decision leaves out counts as no entries")
    func missingKeys() throws {
        #expect(try PolicyDecision(result: ["result": ["warn": [entry]]]).findings.map(\.level) == [.warning])
        #expect(try PolicyDecision(result: ["result": [:]]).findings.isEmpty)
    }

    @Test("A result that is not a decision is an error")
    func malformed() {
        #expect(throws: (any Error).self) { try PolicyDecision(result: ["result": "nope"]) }
        #expect(throws: (any Error).self) { try PolicyDecision(result: ["result": ["deny": [["rule_id": "x"]]]]) }
    }

    @Test("A finding prints as a file:line:column diagnostic with its rule")
    func diagnostic() throws {
        let finding = try #require(PolicyDecision(result: ["result": ["deny": [entry]]]).findings.first)
        #expect(finding.diagnostic(in: "Sources/App/View.swift") == "Sources/App/View.swift:3:7: error: Do not. [example.rule]")
    }
}
