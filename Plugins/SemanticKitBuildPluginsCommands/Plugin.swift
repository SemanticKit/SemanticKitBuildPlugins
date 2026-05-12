import Foundation
import PackagePlugin

@main
struct SemanticKitBuildPluginsCommands: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        let tool = try context.tool(named: "SemanticKitBuildPluginsTool")
        let process = Process()
        process.executableURL = tool.url
        process.arguments = [
            "--package-directory",
            context.package.directoryURL.path,
        ] + arguments

        try process.run()
        process.waitUntilExit()

        guard process.terminationStatus == 0 else {
            throw SemanticKitPluginError.toolFailed(process.terminationStatus)
        }
    }
}

enum SemanticKitPluginError: Error, CustomStringConvertible {
    case toolFailed(Int32)

    var description: String {
        switch self {
        case .toolFailed(let status):
            "SemanticKitBuildPluginsTool failed with exit code \(status)."
        }
    }
}
