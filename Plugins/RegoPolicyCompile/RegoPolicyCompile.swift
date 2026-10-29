import Foundation
import PackagePlugin

@main
struct RegoPolicyCompile: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let regoFiles = sourceTarget.sourceFiles(withSuffix: ".rego").map(\.url)
        guard !regoFiles.isEmpty else { return [] }

        let opa = try opaExecutable(context)

        return regoFiles.map { regoFile in
            let outputArchive = context.pluginWorkDirectoryURL
                .appendingPathComponent("\(regoFile.deletingPathExtension().lastPathComponent).tar.gz")

            return .buildCommand(
                displayName: "Compile Rego plan \(regoFile.lastPathComponent)",
                executable: opa,
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
