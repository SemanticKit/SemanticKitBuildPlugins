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
        let policyRoots = discoverPolicyRoots(package: context.package)
        let policyFiles = policyRoots.flatMap { discoverFiles(under: $0, matchingExtensions: ["rego"]) }
        let policyPlans = discoverPolicyEntrypoints(in: policyFiles).map { entrypoint in
            PolicyPlan(
                packageName: entrypoint.packageName,
                entrypoint: entrypoint.entrypoint,
                query: entrypoint.query,
                archive: outputDirectory.appendingPathComponent("opa-plan-\(entrypoint.outputName).tar.gz")
            )
        }
        let targetSwiftFiles = swiftFiles(for: target)

        var commands: [Command] = []
        for policyPlan in policyPlans {
            commands.append(
                .buildCommand(
                    displayName: "Build OPA plan for \(policyPlan.packageName)",
                    executable: URL(fileURLWithPath: "/Users/me/.local/bin/opa"),
                    arguments: [
                        "build",
                        "--target",
                        "plan",
                        "--entrypoint",
                        policyPlan.entrypoint,
                        "--output",
                        policyPlan.archive.path,
                    ] + policyRoots.map(\.path),
                    inputFiles: policyFiles,
                    outputFiles: [policyPlan.archive]
                )
            )
        }

        if !targetSwiftFiles.isEmpty {
            var evaluatorArguments = [
                "--package-directory",
                context.package.directoryURL.path,
            ]
            for sourceFile in targetSwiftFiles {
                evaluatorArguments.append(contentsOf: ["--swift-source", sourceFile.path])
            }

            var evaluatorInputFiles = targetSwiftFiles
            for policyPlan in policyPlans {
                evaluatorArguments.append(contentsOf: [
                    "--policy-bundle",
                    policyPlan.archive.path,
                    "--policy-query",
                    policyPlan.query,
                ])
                evaluatorInputFiles.append(policyPlan.archive)
            }

            commands.append(
                .buildCommand(
                    displayName: "Evaluate Rego policies for \(target.name)",
                    executable: tool.url,
                    arguments: evaluatorArguments,
                    inputFiles: evaluatorInputFiles,
                    outputFiles: []
                )
            )
        }

        return commands
    }

    private struct PolicyEntrypoint {
        var packageName: String
        var entrypoint: String
        var query: String
        var outputName: String
    }

    private struct PolicyPlan {
        var packageName: String
        var entrypoint: String
        var query: String
        var archive: URL
    }

    private func discoverPolicyEntrypoints(in policyFiles: [URL]) -> [PolicyEntrypoint] {
        policyFiles.compactMap(policyEntrypoint(for:))
            .sorted { $0.packageName < $1.packageName }
    }

    private func policyEntrypoint(for policyFile: URL) -> PolicyEntrypoint? {
        guard policyFile.lastPathComponent != "main.rego",
              policyFile.lastPathComponent != "semantic_kit.rego",
              let source = try? String(contentsOf: policyFile, encoding: .utf8),
              source.contains("decision :="),
              let packageName = packageName(in: source) else {
            return nil
        }

        return PolicyEntrypoint(
            packageName: packageName,
            entrypoint: packageName.replacingOccurrences(of: ".", with: "/") + "/decision",
            query: "data.\(packageName).decision",
            outputName: sanitizedPlanOutputName(for: packageName)
        )
    }

    private func packageName(in source: String) -> String? {
        source.split(separator: "\n").lazy.compactMap { line -> String? in
            let trimmedLine = String(line).trimmingCharacters(in: .whitespaces)
            guard trimmedLine.hasPrefix("package ") else { return nil }
            let packageName = String(trimmedLine.dropFirst("package ".count)).trimmingCharacters(in: .whitespaces)
            return packageName.isEmpty ? nil : packageName
        }.first
    }

    private func sanitizedPlanOutputName(for packageName: String) -> String {
        let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "._-"))
        let sanitized = packageName.unicodeScalars.map { scalar in
            allowedCharacters.contains(scalar) ? String(scalar) : "_"
        }.joined()
        return sanitized.replacingOccurrences(of: ".", with: "_")
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
