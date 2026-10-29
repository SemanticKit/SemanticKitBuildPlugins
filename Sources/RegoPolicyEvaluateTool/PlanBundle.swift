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

    /// The query of each plan whose entrypoint is a policy's `decision`
    /// rule, such as `data.apple.hig.color.hardcoded_color.decision`.
    var decisionQueries: [String] {
        get throws {
            try bundle.planFiles.flatMap { file in
                try JSONDecoder().decode(PlanNames.self, from: file.data).plans.plans.map(\.name)
            }
            .filter { $0 == "decision" || $0.hasSuffix("/decision") }
            .map { "data.\($0.replacingOccurrences(of: "/", with: "."))" }
        }
    }
}

/// The plan names in a `plan.json`: `{"plans": {"plans": [{"name": ...}]}}`.
private struct PlanNames: Decodable {
    struct Plans: Decodable {
        struct Plan: Decodable {
            let name: String
        }

        let plans: [Plan]
    }

    let plans: Plans
}

private struct NotAPlanBundle: Error, CustomStringConvertible {
    let url: URL

    var description: String {
        "\(url.path) holds no plan.json; build it with `opa build --target plan`"
    }
}
