import Foundation
import PackagePlugin

/// Evaluates every Swift file of a target against the policy plan bundles
/// (`*.plan.tar.gz` from `RegoPolicyPlanBundle`) of the target and of the
/// targets it depends on, including targets from other packages.
///
/// Findings print as `file:line:column: warning|error|note: message [rule]`.
/// A `deny` finding fails the build.
@main
struct RegoPolicyEvaluate: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let swiftFiles = sourceTarget.sourceFiles(withSuffix: ".swift").map(\.url)
        guard !swiftFiles.isEmpty else { return [] }

        let policyTargets = [sourceTarget] + target.recursiveTargetDependencies.compactMap { $0 as? SourceModuleTarget }
        let bundles = policyTargets
            .flatMap(\.pluginGeneratedResources)
            .filter { $0.lastPathComponent.hasSuffix(".plan.tar.gz") }
        guard !bundles.isEmpty else { return [] }

        let tool = try context.tool(named: "RegoPolicyEvaluateTool")
        let bundleArguments = bundles.flatMap { ["--bundle", $0.path] }
        let targetComponents = sourceTarget.directoryURL.standardizedFileURL.pathComponents

        return swiftFiles.map { swiftFile in
            // The command's output is a Swift file holding only a comment, so
            // SwiftPM runs the command whenever the source or a bundle changes.
            let fileComponents = swiftFile.standardizedFileURL.deletingPathExtension().pathComponents
            let relativeName = fileComponents.starts(with: targetComponents)
                ? fileComponents.dropFirst(targetComponents.count).joined(separator: "_")
                : swiftFile.deletingPathExtension().lastPathComponent
            let record = context.pluginWorkDirectoryURL
                .appendingPathComponent("\(relativeName)+RegoPolicyEvaluate.swift")
            return .buildCommand(
                displayName: "Evaluate Rego policies \(swiftFile.lastPathComponent)",
                executable: tool.url,
                arguments: ["--source", swiftFile.path, "--record", record.path] + bundleArguments,
                inputFiles: [swiftFile] + bundles,
                outputFiles: [record]
            )
        }
    }
}
