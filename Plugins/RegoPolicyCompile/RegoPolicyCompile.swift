import Foundation
import PackagePlugin

@main
struct RegoPolicyCompile: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let regoFiles = sourceTarget.sourceFiles(withSuffix: ".rego").map(\.url)
        guard !regoFiles.isEmpty else { return [] }

        return regoFiles.map { regoFile in
            let outputArchive = context.pluginWorkDirectoryURL
                .appendingPathComponent("\(regoFile.deletingPathExtension().lastPathComponent).tar.gz")

            return .buildCommand(
                displayName: "Compile Rego plan \(regoFile.lastPathComponent)",
                executable: URL(fileURLWithPath: "/Users/me/.local/bin/opa"),
                arguments: [
                    "build",
                    "--output",
                    outputArchive.path,
                    regoFile.path,
                ],
                inputFiles: [regoFile],
                outputFiles: [outputArchive]
            )
        }
    }
}
