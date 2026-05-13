import Foundation
import PackagePlugin

@main
struct SemanticKitBuildPluginsBuildTool: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let tool = try context.tool(named: "SemanticKitBuildPluginsTool")
        let outputDirectory = context.pluginWorkDirectoryURL.appendingPathComponent(
            "SemanticKitBuildPlugins",
            isDirectory: true
        )
        let bundleArchive = outputDirectory.appendingPathComponent("semantic-kit-policy-bundle.tar.gz")
        let outputFile = outputDirectory.appendingPathComponent("semantic-kit-build-tool-validation.txt")
        let policyRoots = discoverPolicyRoots(package: context.package)
        let policyFiles = policyRoots.flatMap { discoverFiles(under: $0, matchingExtensions: ["rego"]) }
        let projectInputFiles = discoverProjectInputFiles(context: context, target: target)

        var commands: [Command] = []
        if !policyFiles.isEmpty {
            commands.append(
                .buildCommand(
                    displayName: "Build SemanticKit OPA bundle for \(target.name)",
                    executable: URL(fileURLWithPath: "/Users/me/.local/bin/opa"),
                    arguments: [
                        "build",
                        "--target",
                        "plan",
                        "--entrypoint",
                        "semantickit/main/decision",
                        "--output",
                        bundleArchive.path,
                    ] + policyRoots.map(\.path),
                    inputFiles: policyFiles,
                    outputFiles: [bundleArchive]
                )
            )
        }

        var evaluatorArguments = [
            "--package-directory",
            context.package.directoryURL.path,
            "build-tool",
            "--target",
            target.name,
            "--output-directory",
            outputDirectory.path,
        ]
        for policyRoot in policyRoots {
            evaluatorArguments.append(contentsOf: ["--policy-root", policyRoot.path])
        }
        var evaluatorInputFiles = projectInputFiles
        if !policyFiles.isEmpty {
            evaluatorArguments.append(contentsOf: ["--policy-bundle", bundleArchive.path])
            evaluatorInputFiles.append(bundleArchive)
        }

        commands.append(
            .buildCommand(
                displayName: "Evaluate SemanticKit Rego policies for \(target.name)",
                executable: tool.url,
                arguments: evaluatorArguments,
                inputFiles: evaluatorInputFiles,
                outputFiles: [outputFile]
            )
        )

        return commands
    }

    private func discoverPolicyRoots(package: Package) -> [URL] {
        var roots = [package.directoryURL.appendingPathComponent("Policies", isDirectory: true)]
        for dependency in package.dependencies {
            roots.append(contentsOf: discoverPolicyRoots(package: dependency.package))
        }
        return Array(Set(roots.map(\.standardizedFileURL)))
            .filter { FileManager.default.fileExists(atPath: $0.path) }
            .sorted { $0.path < $1.path }
    }

    private func discoverProjectInputFiles(context: PluginContext, target: Target) -> [URL] {
        var files = [context.package.directoryURL.appendingPathComponent("Package.swift")]
        if let sourceTarget = target as? SourceModuleTarget {
            files.append(contentsOf: sourceTarget.sourceFiles.map(\.url))
        }

        let workflowsRoot = context.package.directoryURL.appendingPathComponent(".github/workflows", isDirectory: true)
        files.append(contentsOf: discoverFiles(under: workflowsRoot, matchingExtensions: ["yml", "yaml"]))

        return Array(Set(files.map(\.standardizedFileURL))).sorted { $0.path < $1.path }
    }

    private func discoverFiles(under root: URL, matchingExtensions allowedExtensions: Set<String>) -> [URL] {
        guard FileManager.default.fileExists(atPath: root.path),
              let enumerator = FileManager.default.enumerator(at: root, includingPropertiesForKeys: [.isRegularFileKey]) else {
            return []
        }

        var files: [URL] = []
        while let fileURL = enumerator.nextObject() as? URL {
            guard allowedExtensions.contains(fileURL.pathExtension.lowercased()) else { continue }
            files.append(fileURL)
        }
        return files.sorted { $0.path < $1.path }
    }
}
