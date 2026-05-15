import Foundation
import PackagePlugin

@main
struct RegoPolicyCompile: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        guard let sourceTarget = target as? SourceModuleTarget else { return [] }
        let regoFiles = (regoFiles(in: sourceTarget) + dependencyRegoFiles(for: sourceTarget))
            .sorted { $0.path < $1.path }
        guard !regoFiles.isEmpty else { return [] }

        let targetKind = try regoFiles.contains(where: hasEntrypointAnnotation(in:)) ? "plan" : "rego"
        let outputArchive = context.pluginWorkDirectoryURL
            .appendingPathComponent("\(sanitizedOutputName(for: target.name)).\(targetKind).tar.gz")

        return [
            .buildCommand(
                displayName: "Compile Rego \(targetKind) bundle \(target.name)",
                executable: URL(fileURLWithPath: "/Users/me/.local/bin/opa"),
                arguments: [
                    "build",
                    "--target",
                    targetKind,
                    "--output",
                    outputArchive.path,
                ] + regoFiles.map(\.path),
                inputFiles: regoFiles,
                outputFiles: [outputArchive]
            ),
        ]
    }

    private func hasEntrypointAnnotation(in regoFile: URL) throws -> Bool {
        let source = try String(contentsOf: regoFile, encoding: .utf8)
        return source.contains("# entrypoint: true")
    }

    private func regoFiles(in target: SourceModuleTarget) -> [URL] {
        target.sourceFiles(withSuffix: ".rego").map(\.url)
    }

    private func dependencyRegoFiles(for target: SourceModuleTarget) -> [URL] {
        target.dependencies.flatMap { dependency -> [URL] in
            guard case .target(let dependencyTarget as SourceModuleTarget) = dependency else {
                return []
            }

            return regoFiles(in: dependencyTarget)
        }
    }

    private func sanitizedOutputName(for name: String) -> String {
        let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "._-"))
        let sanitized = name.unicodeScalars.map { scalar in
            allowedCharacters.contains(scalar) ? String(scalar) : "_"
        }.joined()
        return sanitized.replacingOccurrences(of: ".", with: "_")
    }
}
