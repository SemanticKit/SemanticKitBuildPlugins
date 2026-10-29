import AST
import Foundation
import Rego

/// The `decision` query of every policy in a set of plan bundles, prepared
/// once and evaluated against every syntax node of a file.
///
/// Each bundle gets its own engine, so preparing a query compiles only that
/// bundle's plans.
struct PolicyEvaluation {
    private let queries: [OPA.Engine.PreparedQuery]

    init(bundles: [PlanBundle]) async throws {
        var queries: [OPA.Engine.PreparedQuery] = []
        for bundle in bundles {
            var engine = OPA.Engine(bundles: [bundle.name: bundle.bundle])
            for query in bundle.decisionQueries {
                queries.append(try await engine.prepareForEvaluation(query: query))
            }
        }
        self.queries = queries
    }

    /// Every finding of every policy, ordered by position in the file.
    ///
    /// Policies run concurrently; each one visits the nodes in order.
    func findings(for nodes: [AST.RegoValue]) async throws -> [PolicyFinding] {
        try await withThrowingTaskGroup(of: [PolicyFinding].self) { group in
            for query in queries {
                group.addTask {
                    var findings: [PolicyFinding] = []
                    for node in nodes {
                        let results = query.supportsSyncEvaluation
                            ? try Self.evaluateSynchronously(query, input: node)
                            : try await query.evaluate(input: node)
                        for result in results {
                            findings += try PolicyDecision(result: result).findings
                        }
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

    /// Runs a query on SwiftOPA's synchronous path, which skips the
    /// suspension points of the async one for each of the many nodes.
    private static func evaluateSynchronously(_ query: OPA.Engine.PreparedQuery, input: AST.RegoValue) throws -> ResultSet {
        try query.evaluate(input: input)
    }
}
