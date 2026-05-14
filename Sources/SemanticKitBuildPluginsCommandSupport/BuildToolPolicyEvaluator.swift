import Foundation
import SemanticKitBuildPluginsCore
import SemanticKitBuildPluginsFacts
import SemanticKitBuildPluginsPolicy

public struct BuildToolPolicyEvaluator {
    private let policyEngine = SwiftOPAPolicyEngine()
    private let swiftFactCollector = SwiftSourceFactCollector()

    public init() {}

    public func evaluate(
        packageDirectory: URL,
        sourceFiles: [URL] = [],
        policyBundleArchive: URL? = nil
    ) async -> CommandResult {
        var report = ValidationReport()

        var swiftFacts: SwiftSourceFacts
        do {
            swiftFacts = try swiftFactCollector.collect(
                sourceFiles: sourceFiles,
                packageDirectory: packageDirectory
            )
        } catch {
            report.append(
                ValidationDiagnostic(
                    severity: .error,
                    message: "Unable to collect Swift source facts: \(error)",
                    location: sourceFiles.first.map { relativeArtifactPath(fileURL: $0, packageDirectory: packageDirectory) }
                )
            )
            swiftFacts = SwiftSourceFacts()
        }

        let policyInput = PolicyInput(
            swiftSourceFacts: swiftFacts
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
            messages = ["Policy validation failed."]
        } else {
            messages = ["Policy validation passed."]
        }

        return CommandResult(exitCode: report.hasErrors ? 1 : 0, messages: messages, diagnostics: report.diagnostics)
    }

    private func relativeArtifactPath(fileURL: URL, packageDirectory: URL) -> String {
        let packagePath = packageDirectory.standardizedFileURL.path
        let filePath = fileURL.standardizedFileURL.path
        if filePath.hasPrefix(packagePath + "/") {
            return String(filePath.dropFirst(packagePath.count + 1))
        }
        return fileURL.lastPathComponent
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
