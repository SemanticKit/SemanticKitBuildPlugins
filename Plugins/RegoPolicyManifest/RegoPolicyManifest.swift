import Foundation
import PackagePlugin

/// Writes one source bundle per policy: the `.rego` file plus a `.manifest`
/// whose root is the policy's package path.
///
/// The root is the policy's path under the target directory without the
/// `.rego` extension, so `apple/hig/color/hardcoded_color.rego` gets the root
/// `apple/hig/color/hardcoded_color` and must declare
/// `package apple.hig.color.hardcoded_color`. Each bundle is named after its
/// root (`apple.hig.color.hardcoded_color.bundle.tar.gz`), so the bundles of a
/// target never collide as target resources.
@main
struct RegoPolicyManifest: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let regoFiles = sourceTarget.sourceFiles(withSuffix: ".rego").map(\.url)
        guard !regoFiles.isEmpty else { return [] }

        let tool = try context.tool(named: "RegoPolicyManifestTool")
        let targetComponents = sourceTarget.directoryURL.standardizedFileURL.pathComponents

        return try regoFiles.map { regoFile in
            let fileComponents = regoFile.standardizedFileURL.deletingPathExtension().pathComponents
            guard fileComponents.starts(with: targetComponents), fileComponents.count > targetComponents.count else {
                throw PolicyOutsideTarget(policy: regoFile, target: sourceTarget.directoryURL)
            }
            let rootComponents = fileComponents.dropFirst(targetComponents.count)
            let root = rootComponents.joined(separator: "/")
            let sourceBundle = context.pluginWorkDirectoryURL
                .appendingPathComponent("\(rootComponents.joined(separator: ".")).bundle.tar.gz")

            return .buildCommand(
                displayName: "Write Rego source bundle \(root)",
                executable: tool.url,
                arguments: [
                    "--rego", regoFile.path,
                    "--root", root,
                    "--output", sourceBundle.path,
                ],
                inputFiles: [regoFile],
                outputFiles: [sourceBundle]
            )
        }
    }
}

private struct PolicyOutsideTarget: Error, CustomStringConvertible {
    let policy: URL
    let target: URL

    var description: String {
        "\(policy.path) is not inside the target directory \(target.path)"
    }
}
