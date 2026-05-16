import Foundation
import Rego

@main
struct RegoPolicyManifestTool {
    static func main() throws {
        try run()
    }

    private static func run() throws {
        var regoPath: String?
        var outDirPath: String?

        var args = CommandLine.arguments.dropFirst().makeIterator()
        while let arg = args.next() {
            switch arg {
            case "--rego":
                guard let value = args.next(), !value.hasPrefix("--") else {
                    throw UsageError("missing value for --rego")
                }
                regoPath = value
            case "--out-dir":
                guard let value = args.next(), !value.hasPrefix("--") else {
                    throw UsageError("missing value for --out-dir")
                }
                outDirPath = value
            default:
                throw UsageError("unknown argument: \(arg)")
            }
        }

        guard let regoPath, let outDirPath else {
            throw UsageError("missing required arguments")
        }

        let regoURL = URL(fileURLWithPath: regoPath)
        let rootPath = try deriveRootPath(fromRegoPath: regoURL)

        let outDirURL = URL(fileURLWithPath: outDirPath, isDirectory: true)
        try FileManager.default.createDirectory(at: outDirURL, withIntermediateDirectories: true, attributes: nil)

        let manifest = OPA.Manifest(roots: [rootPath])
        let manifestData = try JSONEncoder().encode(manifest)
        try manifestData.write(to: outDirURL.appendingPathComponent(".manifest"), options: [.atomic])
    }

    private static func deriveRootPath(fromRegoPath regoURL: URL) throws -> String {
        // Expect policies under .../Sources/<TargetName>/.../<file>.rego
        // Root path is the relative path under the target directory, minus extension.
        let components = regoURL.pathComponents
        guard let sourcesIdx = components.lastIndex(of: "Sources"),
            components.count > sourcesIdx + 2
        else {
            throw UsageError("rego path is not under Sources/<TargetName>: \(regoURL.path)")
        }

        // Drop "Sources/<TargetName>"
        let relativeComponents = Array(components[(sourcesIdx + 2)...])
        guard let last = relativeComponents.last, last.hasSuffix(".rego") else {
            throw UsageError("rego path does not end in .rego: \(regoURL.path)")
        }

        let stem = String(last.dropLast(".rego".count))
        let dirParts = relativeComponents.dropLast()
        let joined = (dirParts + [stem]).joined(separator: "/")
        return joined
    }
}

private struct UsageError: CustomStringConvertible, Swift.Error {
    let description: String

    init(_ description: String) {
        self.description = description
    }
}
