import AST
import Foundation
import Rego

/// The `decision` query of every policy in a set of plan bundles, prepared
/// once and evaluated against the syntax nodes of a file.
///
/// Each bundle gets its own engine, so preparing a query compiles only that
/// bundle's plans. Each policy sees only the nodes of the types its plan
/// tests `input.type` against (``PolicyScope``), or every node when it
/// reads `input` some other way.
struct PolicyEvaluation {
    struct Policy {
        let query: OPA.Engine.PreparedQuery
        let nodeTypes: Set<String>?
    }

    let policies: [Policy]

    /// Prepares the policies of every `*.plan` bundle ``PolicyPlanner`` wrote in `directory`.
    init(plansIn directory: URL) async throws {
        let bundles = try FileManager.default.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil)
            .filter { $0.lastPathComponent.hasSuffix(".plan") }
            .sorted { $0.lastPathComponent < $1.lastPathComponent }
            .map(PlanBundle.init(directory:))
        try await self.init(bundles: bundles)
    }

    init(bundles: [PlanBundle]) async throws {
        var policies: [Policy] = []
        for bundle in bundles {
            var engine = OPA.Engine(bundles: [bundle.name: bundle.bundle])
            let scope = try bundle.scope
            for name in try bundle.decisionQueries {
                let query = try await engine.prepareForEvaluation(query: name)
                policies.append(Policy(query: query, nodeTypes: try await Self.checked(scope, of: query)))
            }
        }
        self.policies = policies
    }

    /// Every finding of every policy in `input`, ordered by position in the file.
    ///
    /// Policies run concurrently; each one visits its nodes in order.
    func findings(in input: SyntaxInput) async throws -> [PolicyFinding] {
        try await withThrowingTaskGroup(of: [PolicyFinding].self) { group in
            for policy in policies {
                let nodes = input.nodes(ofTypes: policy.nodeTypes)
                group.addTask {
                    var findings: [PolicyFinding] = []
                    for node in nodes {
                        findings += try await Self.findings(of: policy.query, in: node)
                    }
                    return findings
                }
            }
            var findings: Set<PolicyFinding> = []
            for try await policyFindings in group {
                findings.formUnion(policyFindings)
            }
            return findings.sorted()
        }
    }

    /// The scope, if a node of a type it leaves out gets a decision with no
    /// findings; `nil` (every node) otherwise.
    ///
    /// Every such node gets the same decision, so one node of a type the
    /// scope does not name stands for all of them.
    private static func checked(_ scope: PolicyScope, of query: OPA.Engine.PreparedQuery) async throws -> Set<String>? {
        guard let nodeTypes = scope.nodeTypes else { return nil }
        var outsideType = "PolicyScopeProbe"
        while nodeTypes.contains(outsideType) {
            outsideType += "_"
        }
        let outside: AST.RegoValue = ["type": .string(outsideType), "children": []]
        return try await findings(of: query, in: outside).isEmpty ? nodeTypes : nil
    }

    private static func findings(of query: OPA.Engine.PreparedQuery, in node: AST.RegoValue) async throws -> [PolicyFinding] {
        let results = query.supportsSyncEvaluation
            ? try evaluateSynchronously(query, input: node)
            : try await query.evaluate(input: node)
        return try results.flatMap { try PolicyDecision(result: $0).findings }
    }

    /// Runs a query on SwiftOPA's synchronous path, which skips the
    /// suspension points of the async one for each of the many nodes.
    private static func evaluateSynchronously(_ query: OPA.Engine.PreparedQuery, input: AST.RegoValue) throws -> ResultSet {
        try query.evaluate(input: input)
    }
}
