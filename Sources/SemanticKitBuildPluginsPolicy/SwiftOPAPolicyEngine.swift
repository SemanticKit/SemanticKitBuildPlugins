import AST
import Foundation
import Rego
import SemanticKitBuildPluginsCore

public struct SwiftOPAPolicyEngine {
    public init() {}

    public var backendName: String { "SwiftOPA" }

    public func evaluate(_ input: AST.RegoValue, preparedBundleDirectory: URL?) async -> PolicyEvaluation {
        do {
            guard let preparedBundleDirectory else {
                return PolicyEvaluation(backendName: backendName, diagnostics: [])
            }
            let diagnostics = try await Self.evaluateBundleAsync(bundleDirectory: preparedBundleDirectory, input: input)
            return PolicyEvaluation(backendName: backendName, diagnostics: diagnostics)
        } catch {
            return PolicyEvaluation(
                backendName: backendName,
                diagnostics: [
                    ValidationDiagnostic(
                        severity: .error,
                        message: "Policy evaluation failed: \(error)",
                        location: "Policies",
                        ruleID: "semantickit.build_plugins.policy_evaluation_failed"
                    )
                ]
            )
        }
    }

    private static func evaluateBundleAsync(bundleDirectory: URL, input: AST.RegoValue) async throws -> [ValidationDiagnostic] {
        let bundle = try loadBundleFromDirectory(bundleDirectory)
        var engine = OPA.Engine(bundles: ["semantic-kit": bundle])

        let prepared = try await engine.prepareForEvaluation(query: "data.semantickit.main.decision")
        let resultSet = try await prepared.evaluate(input: input)

        return try parseDiagnostics(from: resultSet)
    }

    private static func loadBundleFromDirectory(_ directory: URL) throws -> OPA.Bundle {
        let fileManager = FileManager.default
        let manifestURL = directory.appendingPathComponent(".manifest")
        let planURL = directory.appendingPathComponent("plan.json")
        let dataURL = directory.appendingPathComponent("data.json")

        let manifestData = try Data(contentsOf: manifestURL)
        let manifest = try OPA.Manifest(from: manifestData)

        let planFiles = [
            BundleFile(url: URL(string: "/plan.json")!, data: try Data(contentsOf: planURL))
        ]

        let regoFiles: [BundleFile]
        let policiesDirectory = directory.appendingPathComponent("Policies", isDirectory: true)
        if fileManager.fileExists(atPath: policiesDirectory.path) {
            let files = try fileManager.contentsOfDirectory(at: policiesDirectory, includingPropertiesForKeys: nil)
                .filter { $0.pathExtension == "rego" }
                .sorted { $0.path < $1.path }
            regoFiles = try files.map {
                BundleFile(url: URL(string: "/Policies/\($0.lastPathComponent)")!, data: try Data(contentsOf: $0))
            }
        } else {
            regoFiles = []
        }

        let dataValue: AST.RegoValue
        if fileManager.fileExists(atPath: dataURL.path) {
            dataValue = try AST.RegoValue(jsonData: Data(contentsOf: dataURL))
        } else {
            dataValue = .object([:])
        }

        return try OPA.Bundle(manifest: manifest, planFiles: planFiles, regoFiles: regoFiles, data: dataValue)
    }

    private static func parseDiagnostics(from resultSet: ResultSet) throws -> [ValidationDiagnostic] {
        let data = Data(try resultSet.jsonString.utf8)
        let results = try JSONDecoder().decode([PolicyResult].self, from: data)
        if let decision = results.first?.decision {
            return decision.diagnostics
        }
        throw PolicyParseError.missingDecision
    }
}
