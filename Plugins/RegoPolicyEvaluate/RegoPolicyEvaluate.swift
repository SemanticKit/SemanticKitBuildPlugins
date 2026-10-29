import Foundation
import PackagePlugin

/// Evaluates the Swift files of a target against the Rego policies of the
/// target and of every target it depends on, including policy targets from
/// other packages, such as `AppleHumanInterfaceGuidelines`.
///
/// The policies come from each target's `.rego` source files. SwiftPM does
/// not show a plugin the files other plugins generate for other targets, so
/// the command plans the policies itself (`opa build --target plan`) before
/// it evaluates them; nothing it plans becomes a resource of the target.
///
/// Findings print as `file:line:column: warning|error|note: message [rule]`.
/// A `deny` finding fails the build.
@main
struct RegoPolicyEvaluate: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let swiftFiles = sourceTarget.sourceFiles(withSuffix: ".swift").map(\.url)
        let policyTargets = [sourceTarget] + target.recursiveTargetDependencies.compactMap { $0 as? SourceModuleTarget }
        let policies = policyTargets.flatMap { $0.sourceFiles(withSuffix: ".rego").map(\.url) }
        guard !swiftFiles.isEmpty, !policies.isEmpty else { return [] }

        let tool = try context.tool(named: "RegoPolicyEvaluateTool")
        let opa = try opaExecutable(context)
        // The command's declared output is a Swift file holding only a
        // comment, so SwiftPM runs the command whenever an input changes.
        let record = context.pluginWorkDirectoryURL.appendingPathComponent("RegoPolicyFindings.swift")
        let plans = context.pluginWorkDirectoryURL.appendingPathComponent("plans", isDirectory: true)

        return [
            .buildCommand(
                displayName: "Evaluate Rego policies \(target.name)",
                executable: tool.url,
                arguments: ["--opa", opa.path, "--plans", plans.path, "--record", record.path]
                    + policies.flatMap { ["--policy", $0.path] }
                    + swiftFiles.flatMap { ["--source", $0.path] },
                inputFiles: swiftFiles + policies,
                outputFiles: [record]
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
