import Foundation
import Rego
import SWCompression

/// Writes the source bundle for one policy: a `.tar.gz` holding the policy
/// file and a `.manifest` whose single root is the policy's package path.
///
/// `opa build --bundle` reads the root from that manifest, so every compiled
/// policy bundle owns its own root and `opa build --target plan` can merge
/// the bundles of a target without overlapping roots.
@main
struct RegoPolicyManifestTool {
    static func main() throws {
        var regoPath: String?
        var root: String?
        var outputPath: String?

        var arguments = CommandLine.arguments.dropFirst().makeIterator()
        while let argument = arguments.next() {
            switch argument {
            case "--rego":
                regoPath = try value(after: argument, in: &arguments)
            case "--root":
                root = try value(after: argument, in: &arguments)
            case "--output":
                outputPath = try value(after: argument, in: &arguments)
            default:
                throw UsageError("unknown argument: \(argument)")
            }
        }

        guard let regoPath, let root, let outputPath else {
            throw UsageError("usage: RegoPolicyManifestTool --rego <file.rego> --root <package/path> --output <bundle.tar.gz>")
        }

        let policy = try Data(contentsOf: URL(fileURLWithPath: regoPath))
        let manifest = try JSONEncoder().encode(OPA.Manifest(roots: [root]))
        let archive = TarContainer.create(from: [
            entry(named: ".manifest", data: manifest),
            entry(named: "\(root).rego", data: policy),
        ])
        let output = URL(fileURLWithPath: outputPath)
        try FileManager.default.createDirectory(
            at: output.deletingLastPathComponent(),
            withIntermediateDirectories: true
        )
        try GzipArchive.archive(data: archive).write(to: output, options: [.atomic])
    }

    private static func entry(named name: String, data: Data) -> TarEntry {
        var info = TarEntryInfo(name: name, type: .regular)
        info.permissions = Permissions(rawValue: 0o644)
        return TarEntry(info: info, data: data)
    }

    private static func value(
        after argument: String,
        in arguments: inout IndexingIterator<ArraySlice<String>>
    ) throws -> String {
        guard let value = arguments.next(), !value.hasPrefix("--") else {
            throw UsageError("missing value for \(argument)")
        }
        return value
    }
}

private struct UsageError: CustomStringConvertible, Swift.Error {
    let description: String

    init(_ description: String) {
        self.description = description
    }
}
