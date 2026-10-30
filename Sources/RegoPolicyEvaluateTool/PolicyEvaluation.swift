import AST
import Foundation
import Rego

/// The `decision` query of every policy in a set of plan bundles, prepared
/// once and evaluated against the ``SyntaxInput`` of a file.
///
/// Each bundle gets its own engine, so preparing a query compiles only that
/// bundle's plans.
struct PolicyEvaluation {
    let policies: [OPA.Engine.PreparedQuery]

    /// Prepares the policies of every `*.plan` bundle ``PolicyPlanner`` wrote in `directory`.
    init(plansIn directory: URL) async throws {
        let bundles = try FileManager.default.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil)
            .filter { $0.lastPathComponent.hasSuffix(".plan") }
            .sorted { $0.lastPathComponent < $1.lastPathComponent }
            .map(PlanBundle.init(directory:))
        try await self.init(bundles: bundles)
    }

    init(bundles: [PlanBundle]) async throws {
        var policies: [OPA.Engine.PreparedQuery] = []
        for bundle in bundles {
            var engine = OPA.Engine(bundles: [bundle.name: bundle.bundle])
            for name in try bundle.decisionQueries {
                policies.append(try await engine.prepareForEvaluation(query: name))
            }
        }
        self.policies = policies
    }

    /// Every finding of every policy in `input`, ordered by position in the file.
    ///
    /// Each policy reads the whole file once; policies run concurrently.
    func findings(in input: SyntaxInput) async throws -> [PolicyFinding] {
        let value = input.value
        return try await withThrowingTaskGroup(of: [PolicyFinding].self) { group in
            for policy in policies {
                group.addTask { try await Self.findings(of: policy, in: value) }
            }
            var findings: Set<PolicyFinding> = []
            for try await policyFindings in group {
                findings.formUnion(policyFindings)
            }
            return findings.sorted()
        }
    }

    private static func findings(of query: OPA.Engine.PreparedQuery, in input: AST.RegoValue) async throws -> [PolicyFinding] {
        let results = query.supportsSyncEvaluation
            ? try evaluateSynchronously(query, input: input)
            : try await query.evaluate(input: input)
        return try results.flatMap { try PolicyDecision(result: $0).findings }
    }

    /// Runs a query on SwiftOPA's synchronous path, which skips the
    /// suspension points of the async one.
    private static func evaluateSynchronously(_ query: OPA.Engine.PreparedQuery, input: AST.RegoValue) throws -> ResultSet {
        try query.evaluate(input: input)
    }
}
