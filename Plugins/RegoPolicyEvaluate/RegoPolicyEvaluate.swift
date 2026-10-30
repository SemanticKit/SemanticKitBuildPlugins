import Foundation
import PackagePlugin

/// Evaluates the Swift files of a target against the Rego policies of the
/// target and of every target it depends on, including policy targets from
/// other packages, such as `AppleHumanInterfaceGuidelines`.
///
/// The policies come from each target's `.rego` source files. SwiftPM does
/// not show a plugin the files other plugins generate for other targets, so
/// one command plans the policies itself (`opa build --target plan`) into
/// the plugin work directory; it runs again only when a `.rego` file
/// changes. A second command collects the vocabulary the ontologies of the
/// target and of every target it depends on declare (`Class("Animal")`,
/// `Property("knows")`, the ontology types themselves), which policies read
/// as `input.vocabulary`; it runs again when one of those Swift files
/// changes, and rewrites its record only when the vocabulary does. Each Swift
/// file then gets its own evaluate command, which runs again only when that
/// file, the plans or the vocabulary change.
///
/// Each command's declared output is a Swift file holding one comment line,
/// so SwiftPM runs the commands and the target gets no resources from them.
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
        let vocabularySources = policyTargets.flatMap { $0.sourceFiles(withSuffix: ".swift").map(\.url) }
        guard !swiftFiles.isEmpty, !policies.isEmpty else { return [] }

        let tool = try context.tool(named: "RegoPolicyEvaluateTool")
        let opa = try opaExecutable(context)
        let work = context.pluginWorkDirectoryURL
        let plans = work.appendingPathComponent("plans", isDirectory: true)
        let plansRecord = work.appendingPathComponent("RegoPolicyPlans.swift")
        let vocabularyRecord = work.appendingPathComponent("RegoPolicyVocabulary.swift")
        let targetComponents = sourceTarget.directoryURL.standardizedFileURL.pathComponents

        let plan = Command.buildCommand(
            displayName: "Plan Rego policies for \(target.name)",
            executable: tool.url,
            arguments: ["plan", "--opa", opa.path, "--plans", plans.path, "--record", plansRecord.path]
                + policies.flatMap { ["--policy", $0.path] },
            inputFiles: policies,
            outputFiles: [plansRecord]
        )

        let vocabulary = Command.buildCommand(
            displayName: "Collect the ontology vocabulary of \(target.name)",
            executable: tool.url,
            arguments: ["vocabulary", "--record", vocabularyRecord.path] + vocabularySources.flatMap { ["--source", $0.path] },
            inputFiles: vocabularySources,
            outputFiles: [vocabularyRecord]
        )

        let evaluations = swiftFiles.map { swiftFile in
            // Named after the file's path in the target, so no two records
            // share a file name in the module.
            let fileComponents = swiftFile.standardizedFileURL.pathComponents
            let relative = fileComponents.starts(with: targetComponents)
                ? fileComponents.dropFirst(targetComponents.count)
                : [swiftFile.lastPathComponent]
            let record = work.appendingPathComponent("findings", isDirectory: true)
                .appendingPathComponent("RegoPolicyFindings.\(relative.joined(separator: "."))")
            return Command.buildCommand(
                displayName: "Evaluate Rego policies \(swiftFile.lastPathComponent)",
                executable: tool.url,
                arguments: ["evaluate", "--plans", plans.path, "--record", record.path,
                            "--vocabulary", vocabularyRecord.path, "--source", swiftFile.path],
                inputFiles: [swiftFile, plansRecord, vocabularyRecord],
                outputFiles: [record]
            )
        }
        return [plan, vocabulary] + evaluations
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
