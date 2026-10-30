import Foundation
import Testing
@testable import RegoPolicyEvaluateTool

@Suite("Policy evaluation", .tags(.evaluation, .opa))
struct PolicyEvaluationTests {
    /// A policy in the shape of the policy libraries: it denies every call of `forbidden()`.
    static let denyPolicy = """
        package example.forbidden_call

        default decision := {"deny": [], "warn": [], "note": []}

        # METADATA
        # entrypoint: true
        decision := {"deny": denials, "warn": [], "note": []}

        denials := [denial | denial := denial_set[_]]

        denial_set contains {
          "rule_id": "example.forbidden_call",
          "message": "Do not call forbidden().",
          "line": call.range.start.line,
          "column": call.range.start.column,
          "severity": "error",
        } if {
          call := input
          call.type == "FunctionCallExprSyntax"
          callee := call.children[0]
          callee.type == "DeclReferenceExprSyntax"
          callee.children[0].token.text == "forbidden"
        }
        """

    /// A policy that reads `input` without testing its type first.
    static let unscopedPolicy = """
        package example.any_token

        default decision := {"deny": [], "warn": [], "note": []}

        # METADATA
        # entrypoint: true
        decision := {"deny": [], "warn": [], "note": notes}

        notes := [note | note := note_set[_]]

        note_set contains {
          "rule_id": "example.any_token",
          "message": "Found todo.",
          "line": input.range.start.line,
          "column": input.range.start.column,
          "severity": "note",
        } if {
          input.token.text == "todo"
        }
        """

    private func write(_ text: String, _ name: String, in directory: URL) throws -> URL {
        let file = directory.appendingPathComponent(name)
        try Data(text.utf8).write(to: file)
        return file
    }

    @Test("A deny finding prints as an error and makes the tool exit 1")
    func denyFailsTheCommand() async throws {
        let directory = try Repository.temporaryDirectory()
        defer { try? FileManager.default.removeItem(at: directory) }
        let policy = try write(Self.denyPolicy, "forbidden_call.rego", in: directory)
        let source = try write("let a = 1\nlet b = forbidden()\n", "Bad.swift", in: directory)
        let plans = directory.appendingPathComponent("plans").path
        let plansRecord = directory.appendingPathComponent("RegoPolicyPlans.swift")
        let findingsRecord = directory.appendingPathComponent("RegoPolicyFindings.Bad.swift")

        let planned = await RegoPolicyEvaluateTool.run(
            ["plan", "--opa", try Repository.opa.path, "--plans", plans, "--record", plansRecord.path, "--policy", policy.path]
        )
        #expect(planned.status == 0)
        #expect(try String(contentsOf: plansRecord, encoding: .utf8) == "// 1 Rego policies planned\n")

        let denied = await RegoPolicyEvaluateTool.run(
            ["evaluate", "--plans", plans, "--record", findingsRecord.path, "--source", source.path]
        )
        #expect(denied.status == 1)
        #expect(denied.diagnostics == ["\(source.path):2:9: error: Do not call forbidden(). [example.forbidden_call]"])
        #expect(try String(contentsOf: findingsRecord, encoding: .utf8) == "// 1 Rego policy finding(s) in 1 file(s)\n")

        let clean = try write("let a = allowed()\n", "Good.swift", in: directory)
        let passed = await RegoPolicyEvaluateTool.run(
            ["evaluate", "--plans", plans, "--record", findingsRecord.path, "--source", clean.path]
        )
        #expect(passed.status == 0)
        #expect(passed.diagnostics.isEmpty)
    }

    @Test("A policy that tests input.type sees only nodes of that type; one that does not sees every node")
    func scopes() async throws {
        let directory = try Repository.temporaryDirectory()
        defer { try? FileManager.default.removeItem(at: directory) }
        let policies = try [
            write(Self.denyPolicy, "forbidden_call.rego", in: directory),
            write(Self.unscopedPolicy, "any_token.rego", in: directory),
        ]
        let bundles = try await PolicyPlanner(opa: Repository.opa, directory: directory.appendingPathComponent("plans")).plan(policies)
        let evaluation = try await PolicyEvaluation(bundles: bundles)

        #expect(evaluation.policies.map(\.nodeTypes) == [["FunctionCallExprSyntax"], nil])

        let findings = try await evaluation.findings(in: SyntaxInput(source: "forbidden(todo)", fileName: "Mixed.swift"))
        #expect(findings.map(\.ruleID) == ["example.forbidden_call", "example.any_token"])
        #expect(findings.map(\.level) == [.error, .note])
        #expect(findings.map(\.column) == [1, 11])
    }

    /// The node types of the library policies that match nodes other than
    /// calls; every other library policy matches `FunctionCallExprSyntax`.
    static let libraryNodeTypes: [String: Set<String>] = [
        "no_static_term_enum": ["EnumDeclSyntax", "ExtensionDeclSyntax", "StructDeclSyntax", "ClassDeclSyntax", "ActorDeclSyntax"],
        "no_static_iri_constant": ["VariableDeclSyntax"],
        "no_term_registry": [
            "DictionaryTypeSyntax", "IdentifierTypeSyntax", "MemberTypeSyntax", "FunctionCallExprSyntax", "DictionaryExprSyntax",
            "ClassDeclSyntax", "StructDeclSyntax", "EnumDeclSyntax", "ActorDeclSyntax", "ProtocolDeclSyntax",
        ],
        "no_individual_graph": ["TokenSyntax"],
        "no_class_value_constant": ["MemberAccessExprSyntax"],
        "no_values_of_lookup": ["FunctionCallExprSyntax", "FunctionDeclSyntax"],
    ]

    @Test("Every policy in the libraries is planned, loads, and tests the node type it matches")
    func libraryPolicies() async throws {
        let directory = try Repository.temporaryDirectory()
        defer { try? FileManager.default.removeItem(at: directory) }
        let sources = Repository.url("Sources")
        let policies = try #require(FileManager.default.enumerator(at: sources, includingPropertiesForKeys: nil))
            .compactMap { $0 as? URL }
            .filter { $0.pathExtension == "rego" && !$0.path.contains("/ProofPolicy/") }
        #expect(policies.count >= 50)

        let bundles = try await PolicyPlanner(opa: Repository.opa, directory: directory).plan(policies)
        let evaluation = try await PolicyEvaluation(bundles: bundles)
        #expect(evaluation.policies.count == policies.count)
        for (policy, scoped) in zip(policies, evaluation.policies) {
            let name = policy.deletingPathExtension().lastPathComponent
            #expect(scoped.nodeTypes == Self.libraryNodeTypes[name, default: ["FunctionCallExprSyntax"]], "\(name)")
        }
    }
}
