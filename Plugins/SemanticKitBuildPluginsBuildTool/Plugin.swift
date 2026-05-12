import PackagePlugin

@main
struct SemanticKitBuildPluginsBuildTool: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let tool = try context.tool(named: "SemanticKitBuildPluginsTool")
        let outputDirectory = context.pluginWorkDirectoryURL.appendingPathComponent(
            "SemanticKitBuildPlugins",
            isDirectory: true
        )

        return [
            .prebuildCommand(
                displayName: "Validate SemanticKit CI/CD contract for \(target.name)",
                executable: tool.url,
                arguments: [
                    "--package-directory",
                    context.package.directoryURL.path,
                    "build-tool",
                    "--target",
                    target.name,
                    "--output-directory",
                    outputDirectory.path,
                ],
                outputFilesDirectory: outputDirectory
            ),
        ]
    }
}
