import Foundation
import SemanticKitBuildPluginsCore
import SemanticKitBuildPluginsPolicy
import Yams

public struct RepositoryValidator: Sendable {
    private let policyEngine: SwiftOPAPolicyEngine

    public init(policyEngine: SwiftOPAPolicyEngine = SwiftOPAPolicyEngine()) {
        self.policyEngine = policyEngine
    }

    public func validate(packageDirectory: URL) -> CommandResult {
        var report = ValidationReport()
        let configuration = loadConfiguration(packageDirectory: packageDirectory, report: &report)
        let dependencyURLs = readDirectDependencyURLs(packageDirectory: packageDirectory)
        let policyInput = PolicyInput(repositoryConfiguration: configuration, directDependencyURLs: dependencyURLs)
        report.append(contentsOf: policyEngine.evaluate(policyInput).diagnostics)
        report.append(contentsOf: validateGeneratedWorkflow(packageDirectory: packageDirectory))

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

    private func validateGeneratedWorkflow(packageDirectory: URL) -> [ValidationDiagnostic] {
        let url = packageDirectory.appendingPathComponent(".github/workflows/ci.yml")
        guard FileManager.default.fileExists(atPath: url.path) else {
            return []
        }

        do {
            let text = try String(contentsOf: url, encoding: .utf8)
            _ = try YAMLDecoder().decode(GitHubWorkflow.self, from: text)

            if text.contains("Scripts/") || text.contains(".sh") {
                return [
                    ValidationDiagnostic(
                        severity: .error,
                        message: "Generated CI workflow must not use shell-script primary entrypoints.",
                        location: ".github/workflows/ci.yml"
                    ),
                ]
            }
        } catch {
            return [
                ValidationDiagnostic(
                    severity: .error,
                    message: "Unable to decode generated CI workflow: \(error)",
                    location: ".github/workflows/ci.yml"
                ),
            ]
        }

        return []
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
