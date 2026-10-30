import AST
import Foundation
import Rego
import SWCompression

/// A plan bundle written by `opa build --target plan`, unpacked into a
/// directory of its own.
///
/// SwiftOPA reads bundles from directories only, so ``unpack(_:into:)``
/// unpacks the `.tar.gz` archive `opa` writes once, when the policies are
/// planned, and every evaluation reads the directory.
struct PlanBundle {
    let name: String
    let bundle: OPA.Bundle

    /// The files of a plan bundle that SwiftOPA reads.
    private static let bundleFiles: Set<String> = [".manifest", "plan.json", "data.json"]

    /// Reads the bundle unpacked in `directory`.
    init(directory: URL) throws {
        let files = FileManager.default
        func contents(_ name: String) -> Data? {
            files.contents(atPath: directory.appendingPathComponent(name).path)
        }
        guard let plan = contents("plan.json") else {
            throw NotAPlanBundle(url: directory)
        }
        self.name = directory.lastPathComponent
        self.bundle = try OPA.Bundle(
            manifest: try contents(".manifest").map(OPA.Manifest.init(from:)) ?? OPA.Manifest(),
            planFiles: [BundleFile(url: URL(fileURLWithPath: "/plan.json"), data: plan)],
            data: try contents("data.json").map(AST.RegoValue.init(jsonData:)) ?? .object([:])
        )
    }

    /// Unpacks the plan bundle archive `archive` into `directory` and reads it.
    static func unpack(_ archive: URL, into directory: URL) throws -> PlanBundle {
        let entries = try TarContainer.open(container: GzipArchive.unarchive(archive: Data(contentsOf: archive)))
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        for entry in entries where entry.info.type == .regular {
            guard let contents = entry.data,
                  let name = entry.info.name.split(separator: "/").last.map(String.init),
                  bundleFiles.contains(name)
            else {
                continue
            }
            try contents.write(to: directory.appendingPathComponent(name))
        }
        return try PlanBundle(directory: directory)
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
        "\(url.path) holds no plan.json; plan the policies with `RegoPolicyEvaluateTool plan`"
    }
}
