import Foundation
import PackagePlugin

@main
struct RegoPolicyCompile: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let regoFiles = sourceTarget.sourceFiles(withSuffix: ".rego").map(\.url)
        guard !regoFiles.isEmpty else { return [] }

        let outputArchive = context.pluginWorkDirectoryURL
            .appendingPathComponent("\(target.name).tar.gz")

        return [
            .buildCommand(
                displayName: "Compile Rego bundle \(target.name)",
                executable: URL(fileURLWithPath: "/Users/me/.local/bin/opa"),
                arguments: [
                    "build",
                    "--output",
                    outputArchive.path,
                ] + regoFiles.map(\.path),
                inputFiles: regoFiles,
                outputFiles: [outputArchive]
            ),
        ]
    }
}
