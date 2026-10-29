import Foundation
import PackagePlugin

/// Plans every policy of a target into one bundle, `<target>.tar.gz`, for
/// code that evaluates the target's policies together at run time.
///
/// It merges the source bundles of `RegoPolicyManifest`
/// (`*.bundle.tar.gz`), whose disjoint roots keep the merge valid; without
/// them it plans the target's `.rego` files directly.
@main
struct RegoPolicyPlanBundle: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let sourceBundles = sourceTarget.pluginGeneratedResources
            .filter { $0.lastPathComponent.hasSuffix(".bundle.tar.gz") }
        let regoFiles = sourceTarget.sourceFiles(withSuffix: ".rego").map(\.url)
        guard !sourceBundles.isEmpty || !regoFiles.isEmpty else { return [] }

        let opa = try opaExecutable(context)
        let outputArchive = context.pluginWorkDirectoryURL.appendingPathComponent("\(target.name).tar.gz")
        let inputs = sourceBundles.isEmpty ? regoFiles : sourceBundles
        let inputArguments = sourceBundles.isEmpty
            ? regoFiles.map(\.path)
            : sourceBundles.flatMap { ["--bundle", $0.path] }

        return [
            .buildCommand(
                displayName: "Plan bundle Rego policies \(target.name)",
                executable: opa,
                arguments: ["build", "--target", "plan", "--output", outputArchive.path] + inputArguments,
                inputFiles: inputs,
                outputFiles: [outputArchive]
            ),
        ]
    }
}

/// Locates the `opa` executable the build commands run.
///
/// Looks in the tools SwiftPM gives the plugin first, then in each `PATH`
/// directory, then in `~/.local/bin`, where the policy workflow installs it.
private func opaExecutable(_ context: PluginContext) throws -> URL {
    if let tool = try? context.tool(named: "opa") {
        return tool.url
    }
    let environment = ProcessInfo.processInfo.environment
    var directories = (environment["PATH"] ?? "").split(separator: ":").map(String.init)
    if let home = environment["HOME"] {
        directories.append("\(home)/.local/bin")
    }
    for directory in directories {
        let candidate = URL(fileURLWithPath: directory).appendingPathComponent("opa")
        if FileManager.default.isExecutableFile(atPath: candidate.path) {
            return candidate
        }
    }
    throw OpaNotFound()
}

private struct OpaNotFound: Error, CustomStringConvertible {
    var description: String {
        "opa not found: install the OPA CLI on PATH or in ~/.local/bin (https://www.openpolicyagent.org/docs/#running-opa)"
    }
}
