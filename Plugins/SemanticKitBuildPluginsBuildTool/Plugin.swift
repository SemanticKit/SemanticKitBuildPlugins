import Foundation
import PackagePlugin

@main
struct SemanticKitBuildPluginsBuildTool: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let tool = try context.tool(named: "SemanticKitBuildPluginsTool")
        let outputDirectory = context.pluginWorkDirectoryURL.appendingPathComponent(
            "PolicyValidation",
            isDirectory: true
        )
        let bundleArchive = outputDirectory.appendingPathComponent("opa-policy-bundle.tar.gz")
        let outputFile = outputDirectory.appendingPathComponent("policy-validation.txt")
        let policyRoots = discoverPolicyRoots(package: context.package)
        let policyFiles = policyRoots.flatMap { discoverFiles(under: $0, matchingExtensions: ["rego"]) }
        let targetSwiftFiles = swiftFiles(for: target)
        let projectInputFiles = discoverProjectInputFiles(context: context, target: target)

        var commands: [Command] = []
        if !policyFiles.isEmpty {
            commands.append(
                .buildCommand(
                    displayName: "Build OPA policy bundle for \(target.name)",
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
        for sourceFile in targetSwiftFiles {
            evaluatorArguments.append(contentsOf: ["--swift-source", sourceFile.path])
        }
        var evaluatorInputFiles = projectInputFiles
        if !policyFiles.isEmpty {
            evaluatorArguments.append(contentsOf: ["--policy-bundle", bundleArchive.path])
            evaluatorInputFiles.append(bundleArchive)
        }

        commands.append(
            .buildCommand(
                displayName: "Evaluate Rego policies for \(target.name)",
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
        files.append(contentsOf: swiftFiles(for: target))

        return Array(Set(files.map(\.standardizedFileURL))).sorted { $0.path < $1.path }
    }

    private func swiftFiles(for target: Target) -> [URL] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        return sourceTarget.sourceFiles
            .map(\.url)
            .filter { $0.pathExtension.lowercased() == "swift" }
            .sorted { $0.path < $1.path }
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
