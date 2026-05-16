import Foundation
import PackagePlugin

@main
struct RegoPolicyEvaluate: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let swiftFiles = sourceTarget.sourceFiles(withSuffix: ".swift").map(\.url)
        let dependencyResources = sourceTarget.dependencies.flatMap { dependency -> [URL] in
            switch dependency {
            case .target(let target as SourceModuleTarget):
                return target.pluginGeneratedResources
            case .product(let product as LibraryProduct):
                return product.targets.compactMap { $0 as? SourceModuleTarget }.flatMap(\.pluginGeneratedResources)
            default:
                return []   
            }
        }
        let bundles = (sourceTarget.pluginGeneratedResources + dependencyResources)
            .filter { $0.lastPathComponent.hasSuffix(".tar.gz") }

        guard !swiftFiles.isEmpty else { return [] }

        let tool = try context.tool(named: "RegoPolicyEvaluateTool")
        let bundleArguments = bundles.flatMap { ["--bundle", $0.path] }
        return swiftFiles.map { swiftFile in
            .buildCommand(
                displayName: "Evaluate Rego policies \(swiftFile.lastPathComponent)",
                executable: tool.url,
                arguments: ["--source", swiftFile.path] + bundleArguments,
                inputFiles: [swiftFile] + bundles,
                outputFiles: []
            )
        }
    }
}
