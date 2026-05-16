import Foundation
import PackagePlugin

@main
struct RegoPolicyManifest: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let regoFiles = sourceTarget.sourceFiles(withSuffix: ".rego").map(\.url)
        guard !regoFiles.isEmpty else { return [] }

        let tool = try context.tool(named: "RegoPolicyManifestTool")

        return regoFiles.map { regoFile in
            let stem = regoFile.deletingPathExtension().lastPathComponent
            let outDir = context.pluginWorkDirectoryURL.appendingPathComponent(stem, isDirectory: true)
            let manifest = outDir.appendingPathComponent(".manifest")

            return .buildCommand(
                displayName: "Generate Rego manifest \(regoFile.lastPathComponent)",
                executable: tool.url,
                arguments: [
                    "--rego",
                    regoFile.path,
                    "--out-dir",
                    outDir.path,
                ],
                inputFiles: [regoFile],
                outputFiles: [manifest]
            )
        }
    }
}
