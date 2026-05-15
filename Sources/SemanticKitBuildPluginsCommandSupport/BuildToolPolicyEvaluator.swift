import AST
import Foundation
import SemanticKitBuildPluginsCore
import SemanticKitBuildPluginsPolicy

public struct BuildToolPolicyEvaluator {
    private let policyEngine = SwiftOPAPolicyEngine()

    public init() {}

    public func evaluate(
        packageDirectory: URL,
        sourceFiles: [URL] = [],
        policyPlanArchives: [PolicyPlanArchive] = []
    ) async -> CommandResult {
        var diagnostics: [ValidationDiagnostic] = []
        var preparedPolicyPlans: [SwiftOPAPolicyEngine.PreparedPolicyQuery] = []
        var preparedBundleDirectories: [URL] = []

        for policyPlanArchive in policyPlanArchives {
            do {
                let preparedBundleDirectory = try extractPolicyBundleArchive(policyPlanArchive.archive)
                preparedBundleDirectories.append(preparedBundleDirectory)
                let preparedPolicyPlan = try await policyEngine.prepare(
                    preparedBundleDirectory: preparedBundleDirectory,
                    query: policyPlanArchive.query
                )
                preparedPolicyPlans.append(preparedPolicyPlan)
            } catch {
                diagnostics.append(
                    ValidationDiagnostic(
                        severity: .error,
                        message: "Unable to prepare OPA bundle artifacts: \(error)",
                        location: "Policies",
                        ruleID: "semantickit.build_plugins.policy_bundle_prepare_failed"
                    )
                )
            }
        }

        let sourcesToEvaluate: [URL?] = sourceFiles.isEmpty ? [nil] : sourceFiles.map(Optional.some)
        for sourceFile in sourcesToEvaluate {
            let policyInput: AST.RegoValue
            do {
                let inputData = try SwiftSyntaxInput(packageDirectory: packageDirectory).jsonData(for: sourceFile)
                policyInput = try AST.RegoValue(jsonData: inputData)
            } catch {
                diagnostics.append(
                    ValidationDiagnostic(
                        severity: .error,
                        message: "Unable to parse Swift source input: \(error)",
                        location: sourceFile.map { relativeArtifactPath(fileURL: $0, packageDirectory: packageDirectory) } ?? "SwiftSyntax",
                        ruleID: "semantickit.build_plugins.swift_source_input_failed"
                    )
                )
                policyInput = .null
            }

            for preparedPolicyPlan in preparedPolicyPlans {
                diagnostics.append(contentsOf: await preparedPolicyPlan.evaluate(policyInput).diagnostics)
            }
        }

        for preparedBundleDirectory in preparedBundleDirectories {
            try? FileManager.default.removeItem(at: preparedBundleDirectory.deletingLastPathComponent())
        }

        let hasErrors = diagnostics.contains { $0.severity == .error }
        let messages: [String]
        if hasErrors {
            messages = ["Policy validation failed."]
        } else {
            messages = ["Policy validation passed."]
        }

        return CommandResult(exitCode: hasErrors ? 1 : 0, messages: messages, diagnostics: diagnostics)
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
