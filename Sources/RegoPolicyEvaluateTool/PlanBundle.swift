import AST
import Foundation
import Rego
import SWCompression

/// A plan bundle written by `opa build --target plan`, read from its
/// `.tar.gz` archive into memory. SwiftOPA loads bundles from directories
/// only, so the archive is unpacked here.
struct PlanBundle {
    let name: String
    let bundle: OPA.Bundle

    init(contentsOf url: URL) throws {
        let entries = try TarContainer.open(container: GzipArchive.unarchive(archive: Data(contentsOf: url)))

        var manifest = OPA.Manifest()
        var planFiles: [BundleFile] = []
        var data = AST.RegoValue.object([:])
        for entry in entries where entry.info.type == .regular {
            guard let contents = entry.data else { continue }
            let path = entry.info.name.drop { $0 == "/" }
            switch path.split(separator: "/").last {
            case ".manifest":
                manifest = try OPA.Manifest(from: contents)
            case "plan.json":
                planFiles.append(BundleFile(url: URL(fileURLWithPath: String(path)), data: contents))
            case "data.json":
                data = try AST.RegoValue(jsonData: contents)
            default:
                continue
            }
        }
        guard !planFiles.isEmpty else {
            throw NotAPlanBundle(url: url)
        }

        self.name = url.lastPathComponent
        self.bundle = try OPA.Bundle(manifest: manifest, planFiles: planFiles, data: data)
    }

    /// The `decision` query of each policy root the bundle declares.
    var decisionQueries: [String] {
        bundle.manifest.roots
            .filter { !$0.isEmpty }
            .map { "data.\($0.replacingOccurrences(of: "/", with: ".")).decision" }
    }
}

private struct NotAPlanBundle: Error, CustomStringConvertible {
    let url: URL

    var description: String {
        "\(url.path) holds no plan.json; build it with `opa build --target plan`"
    }
}
