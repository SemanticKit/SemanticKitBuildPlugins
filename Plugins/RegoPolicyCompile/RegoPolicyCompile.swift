import Foundation
import PackagePlugin

/// Compiles each policy of a target into its own plan bundle with
/// `opa build --target plan`; `RegoPolicyEvaluate` loads these into SwiftOPA.
///
/// When `RegoPolicyManifest` runs first, each of its source bundles
/// (`<root>.bundle.tar.gz`) compiles to `<root>.plan.tar.gz`, keeping the
/// bundle's root. Without it, each `.rego` file compiles on its own to
/// `<file>.plan.tar.gz` with OPA's default root. The policy's `decision`
/// rule is the plan entrypoint through its `# METADATA` `entrypoint: true`
/// annotation.
@main
struct RegoPolicyCompile: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let sourceBundles = sourceTarget.pluginGeneratedResources
            .filter { $0.lastPathComponent.hasSuffix(".bundle.tar.gz") }
        let regoFiles = sourceTarget.sourceFiles(withSuffix: ".rego").map(\.url)
        guard !sourceBundles.isEmpty || !regoFiles.isEmpty else { return [] }

        let opa = try opaExecutable(context)

        if !sourceBundles.isEmpty {
            return sourceBundles.map { sourceBundle in
                let name = String(sourceBundle.lastPathComponent.dropLast(".bundle.tar.gz".count))
                let compiled = context.pluginWorkDirectoryURL.appendingPathComponent("\(name).plan.tar.gz")
                return .buildCommand(
                    displayName: "Compile Rego plan \(name)",
                    executable: opa,
                    arguments: ["build", "--target", "plan", "--bundle", sourceBundle.path, "--output", compiled.path],
                    inputFiles: [sourceBundle],
                    outputFiles: [compiled]
                )
            }
        }

        return regoFiles.map { regoFile in
            let name = regoFile.deletingPathExtension().lastPathComponent
            let compiled = context.pluginWorkDirectoryURL.appendingPathComponent("\(name).plan.tar.gz")
            return .buildCommand(
                displayName: "Compile Rego plan \(regoFile.lastPathComponent)",
                executable: opa,
                arguments: ["build", "--target", "plan", "--output", compiled.path, regoFile.path],
                inputFiles: [regoFile],
                outputFiles: [compiled]
            )
        }
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
