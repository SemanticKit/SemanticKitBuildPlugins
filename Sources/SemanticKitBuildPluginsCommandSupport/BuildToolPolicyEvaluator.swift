import Foundation
import SemanticKitBuildPluginsCore
import SemanticKitBuildPluginsFacts
import SemanticKitBuildPluginsPolicy
import Yams

public struct BuildToolPolicyEvaluator {
    private let policyEngine = SwiftOPAPolicyEngine()
    private let swiftFactCollector = SwiftSourceFactCollector()

    public init() {}

    public func evaluate(
        packageDirectory: URL,
        policyBundleArchive: URL? = nil,
        policyModuleRoots: [URL] = []
    ) async -> CommandResult {
        var report = ValidationReport()
        let configuration = loadConfiguration(packageDirectory: packageDirectory, report: &report)
        let workflowScan = scanGeneratedWorkflow(packageDirectory: packageDirectory)
        report.append(contentsOf: workflowScan.decodeDiagnostics)

        let policyRoots = policyModuleRoots.isEmpty
            ? discoverPolicyModuleRoots(packageDirectory: packageDirectory)
            : Array(Set(policyModuleRoots.map(\.standardizedFileURL))).sorted { $0.path < $1.path }

        var swiftFacts: SwiftSourceFacts
        var artifactCatalog: ArtifactCatalog
        do {
            swiftFacts = try swiftFactCollector.collect(packageDirectory: packageDirectory)
            artifactCatalog = try swiftFactCollector.collectArtifactCatalog(
                packageDirectory: packageDirectory,
                policyModuleRoots: policyRoots
            )
        } catch {
            report.append(
                ValidationDiagnostic(
                    severity: .error,
                    message: "Unable to collect project artifacts via SwiftSyntax/artifact discovery: \(error)",
                    location: "Sources"
                )
            )
            swiftFacts = SwiftSourceFacts()
            artifactCatalog = ArtifactCatalog(policyModuleRoots: policyRoots.map(\.path))
        }

        let policyInput = PolicyInput(
            repositoryConfiguration: configuration,
            workflowContainsScriptEntrypoints: workflowScan.containsScriptEntrypoints,
            swiftSourceFacts: swiftFacts,
            artifactCatalog: artifactCatalog
        )

        var preparedBundleDirectory: URL?
        do {
            if let policyBundleArchive {
                preparedBundleDirectory = try extractPolicyBundleArchive(policyBundleArchive)
            }
        } catch {
            report.append(
                ValidationDiagnostic(
                    severity: .error,
                    message: "Unable to prepare OPA bundle artifacts: \(error)",
                    location: "Policies"
                )
            )
        }

        report.append(contentsOf: await policyEngine.evaluate(policyInput, preparedBundleDirectory: preparedBundleDirectory).diagnostics)
        if let preparedBundleDirectory {
            try? FileManager.default.removeItem(at: preparedBundleDirectory.deletingLastPathComponent())
        }

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

    private func discoverPolicyModuleRoots(packageDirectory: URL) -> [URL] {
        let localRoot = packageDirectory.appendingPathComponent("Policies", isDirectory: true)
        guard FileManager.default.fileExists(atPath: localRoot.path) else { return [] }
        return [localRoot.standardizedFileURL]
    }

    private func extractPolicyBundleArchive(_ archiveURL: URL) throws -> URL {
        let tempRoot = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString, isDirectory: true)
        let extractedBundle = tempRoot.appendingPathComponent("bundle", isDirectory: true)
        try FileManager.default.createDirectory(at: extractedBundle, withIntermediateDirectories: true)
        try runCommand(
            "tar",
            arguments: ["-xzf", archiveURL.path, "-C", extractedBundle.path],
            currentDirectory: tempRoot
        )
        return extractedBundle
    }

    private func runCommand(_ command: String, arguments: [String], currentDirectory: URL) throws {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        process.arguments = [command] + arguments
        process.currentDirectoryURL = currentDirectory

        let outputPipe = Pipe()
        let errorPipe = Pipe()
        process.standardOutput = outputPipe
        process.standardError = errorPipe

        try process.run()
        process.waitUntilExit()

        guard process.terminationStatus == 0 else {
            let errorOutput = String(data: errorPipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8) ?? ""
            throw NSError(
                domain: "BuildToolPolicyEvaluator.Process",
                code: Int(process.terminationStatus),
                userInfo: [NSLocalizedDescriptionKey: errorOutput]
            )
        }
    }
}

private struct WorkflowScanResult {
    var decodeDiagnostics: [ValidationDiagnostic]
    var containsScriptEntrypoints: Bool
}

