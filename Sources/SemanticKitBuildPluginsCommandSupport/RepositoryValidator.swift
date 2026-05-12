import Foundation
import SemanticKitBuildPluginsCore
import SemanticKitBuildPluginsFacts
import SemanticKitBuildPluginsPolicy
import Yams

public struct RepositoryValidator {
    private let policyEngine: SwiftOPAPolicyEngine
    private let swiftFactCollector: SwiftSourceFactCollector

    public init(
        policyEngine: SwiftOPAPolicyEngine = SwiftOPAPolicyEngine(),
        swiftFactCollector: SwiftSourceFactCollector = SwiftSourceFactCollector()
    ) {
        self.policyEngine = policyEngine
        self.swiftFactCollector = swiftFactCollector
    }

    public func validate(packageDirectory: URL) async -> CommandResult {
        var report = ValidationReport()
        let configuration = loadConfiguration(packageDirectory: packageDirectory, report: &report)
        let dependencyURLs = readDirectDependencyURLs(packageDirectory: packageDirectory)
        let workflowScan = scanGeneratedWorkflow(packageDirectory: packageDirectory)
        report.append(contentsOf: workflowScan.decodeDiagnostics)

        let swiftFacts: SwiftSourceFacts
        do {
            swiftFacts = try swiftFactCollector.collect(packageDirectory: packageDirectory)
        } catch {
            report.append(
                ValidationDiagnostic(
                    severity: .error,
                    message: "Unable to collect Swift source facts via SwiftSyntax: \(error)",
                    location: "Sources"
                )
            )
            swiftFacts = SwiftSourceFacts()
        }

        let policyInput = PolicyInput(
            repositoryConfiguration: configuration,
            directDependencyURLs: dependencyURLs,
            workflowContainsScriptEntrypoints: workflowScan.containsScriptEntrypoints,
            swiftSourceFacts: swiftFacts
        )
        report.append(contentsOf: await policyEngine.evaluate(policyInput, packageDirectory: packageDirectory).diagnostics)

        let messages: [String]
        if report.hasErrors {
            messages = ["SemanticKit CI/CD validation failed."]
        } else {
            messages = ["SemanticKit CI/CD validation passed."]
        }

        return CommandResult(exitCode: report.hasErrors ? 1 : 0, messages: messages, diagnostics: report.diagnostics)
    }

    private func loadConfiguration(packageDirectory: URL, report: inout ValidationReport) -> RepositoryConfiguration {
        let url = packageDirectory.appendingPathComponent(".semantic-kit/ci.yml")
        guard FileManager.default.fileExists(atPath: url.path) else {
            return RepositoryConfiguration()
        }

        do {
            let data = try Data(contentsOf: url)
            return try YAMLDecoder().decode(RepositoryConfiguration.self, from: data)
        } catch {
            report.append(
                ValidationDiagnostic(
                    severity: .error,
                    message: "Unable to decode SemanticKit configuration: \(error)",
                    location: ".semantic-kit/ci.yml"
                )
            )
            return RepositoryConfiguration()
        }
    }

    private func scanGeneratedWorkflow(packageDirectory: URL) -> WorkflowScanResult {
        let url = packageDirectory.appendingPathComponent(".github/workflows/ci.yml")
        guard FileManager.default.fileExists(atPath: url.path) else {
            return WorkflowScanResult(decodeDiagnostics: [], containsScriptEntrypoints: false)
        }

        do {
            let text = try String(contentsOf: url, encoding: .utf8)
            _ = try YAMLDecoder().decode(GitHubWorkflow.self, from: text)

            let hasScriptEntrypoints = text.contains("Scripts/") || text.contains(".sh")
            return WorkflowScanResult(decodeDiagnostics: [], containsScriptEntrypoints: hasScriptEntrypoints)
        } catch {
            return WorkflowScanResult(
                decodeDiagnostics: [
                    ValidationDiagnostic(
                        severity: .error,
                        message: "Unable to decode generated CI workflow: \(error)",
                        location: ".github/workflows/ci.yml"
                    )
                ],
                containsScriptEntrypoints: false
            )
        }
    }

    private func readDirectDependencyURLs(packageDirectory: URL) -> [String] {
        let manifest = packageDirectory.appendingPathComponent("Package.swift")
        guard let text = try? String(contentsOf: manifest, encoding: .utf8) else {
            return []
        }

        let matches = text.matches(of: /\.package\(url:\s*"([^"]+)"/)
        return matches.map { String($0.1) }
    }
}

private struct WorkflowScanResult {
    var decodeDiagnostics: [ValidationDiagnostic]
    var containsScriptEntrypoints: Bool
}
