import Foundation
import PackagePlugin

@main
struct RegoPolicyPlanBundle: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let bundles = sourceTarget.pluginGeneratedResources
            .filter { $0.lastPathComponent.hasSuffix(".tar.gz") }
        guard !bundles.isEmpty else { return [] }

        let outputArchive = context.pluginWorkDirectoryURL
            .appendingPathComponent("\(target.name).tar.gz")

        return [
            .buildCommand(
                displayName: "Plan bundle Rego policies \(target.name)",
                executable: URL(fileURLWithPath: "/Users/me/.local/bin/opa"),
                arguments: [
                    "build",
                    "--target",
                    "plan",
                    "--output",
                    outputArchive.path,
                ] + bundles.flatMap { ["--bundle", $0.path] },
                inputFiles: bundles,
                outputFiles: [outputArchive]
            ),
        ]
    }
}
