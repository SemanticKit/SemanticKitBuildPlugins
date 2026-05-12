import Foundation
import SemanticKitBuildPluginsCore
import SemanticKitBuildPluginsFacts
import SemanticKitBuildPluginsPolicy
import Yams

public struct RepositoryValidator {
    private let policyEngine = SwiftOPAPolicyEngine()
    private let swiftFactCollector = SwiftSourceFactCollector()

    public init() {}

    public func validate(packageDirectory: URL) async -> CommandResult {
        var report = ValidationReport()
        let configuration = loadConfiguration(packageDirectory: packageDirectory, report: &report)
        let dependencyURLs = readDirectDependencyURLs(packageDirectory: packageDirectory)
        let workflowScan = scanGeneratedWorkflow(packageDirectory: packageDirectory)
        report.append(contentsOf: workflowScan.decodeDiagnostics)

        let policyRoots = discoverPolicyModuleRoots(packageDirectory: packageDirectory, report: &report)

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
            directDependencyURLs: dependencyURLs,
            workflowContainsScriptEntrypoints: workflowScan.containsScriptEntrypoints,
            swiftSourceFacts: swiftFacts,
            artifactCatalog: artifactCatalog
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

    private func discoverPolicyModuleRoots(packageDirectory: URL, report: inout ValidationReport) -> [URL] {
        var roots: [URL] = []
        let localRoot = packageDirectory.appendingPathComponent("Policies", isDirectory: true)
        if FileManager.default.fileExists(atPath: localRoot.path) {
            roots.append(localRoot)
        }

        let dependencyRoots = discoverDependencyPolicyRoots(packageDirectory: packageDirectory, report: &report)
        roots.append(contentsOf: dependencyRoots)

        return Array(Set(roots.map(\.standardizedFileURL))).sorted { $0.path < $1.path }
    }

    private func discoverDependencyPolicyRoots(packageDirectory: URL, report: inout ValidationReport) -> [URL] {
        do {
            let data = try runSwiftPackageShowDependencies(packageDirectory: packageDirectory)
            let graph = try JSONDecoder().decode(DependencyNode.self, from: data)
            var roots: [URL] = []
            collectPolicyRoots(from: graph, into: &roots)
            return roots
        } catch {
            report.append(
                ValidationDiagnostic(
                    severity: .warning,
                    message: "Unable to discover dependency policy roots from SwiftPM graph: \(error)",
                    location: "Package.swift"
                )
            )
            return []
        }
    }

    private func runSwiftPackageShowDependencies(packageDirectory: URL) throws -> Data {
        let process = Process()
        process.currentDirectoryURL = packageDirectory
        process.executableURL = URL(fileURLWithPath: "/usr/bin/swift")
        process.arguments = ["package", "show-dependencies", "--format", "json"]

        let output = Pipe()
        let errors = Pipe()
        process.standardOutput = output
        process.standardError = errors

        try process.run()
        process.waitUntilExit()

        guard process.terminationStatus == 0 else {
            let message = String(data: errors.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8) ?? ""
            throw NSError(domain: "RepositoryValidator.DependencyDiscovery", code: Int(process.terminationStatus), userInfo: [NSLocalizedDescriptionKey: message])
        }

        return output.fileHandleForReading.readDataToEndOfFile()
    }

    private func collectPolicyRoots(from node: DependencyNode, into roots: inout [URL]) {
        if let path = node.path {
            let root = URL(fileURLWithPath: path).appendingPathComponent("Policies", isDirectory: true)
            if FileManager.default.fileExists(atPath: root.path) {
                roots.append(root)
            }
        }

        for dependency in node.dependencies {
            collectPolicyRoots(from: dependency, into: &roots)
        }
    }
}

private struct WorkflowScanResult {
    var decodeDiagnostics: [ValidationDiagnostic]
    var containsScriptEntrypoints: Bool
}

private struct DependencyNode: Decodable {
    var identity: String?
    var name: String?
    var path: String?
    var dependencies: [DependencyNode]
}
