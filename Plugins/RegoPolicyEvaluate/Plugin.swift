import PackagePlugin

@main
struct RegoPolicyEvaluate: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let swiftFiles = sourceTarget.sourceFiles(withSuffix: ".swift")
        _ = swiftFiles
        return []
    }
}
