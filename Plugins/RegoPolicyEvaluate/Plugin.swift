import PackagePlugin

@main
struct RegoPolicyEvaluate: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let parserCLI = try context.tool(named: "swift-parser-cli")
        let swiftFiles = sourceTarget.sourceFiles(withSuffix: ".swift").map(\.url)

        return swiftFiles.map { swiftFile in
            .buildCommand(
                displayName: "Parse Swift syntax \(swiftFile.lastPathComponent)",
                executable: parserCLI.url,
                arguments: [
                    "print-tree",
                    swiftFile.path,
                ],
                inputFiles: [swiftFile],
                outputFiles: []
            )
        }
    }
}
