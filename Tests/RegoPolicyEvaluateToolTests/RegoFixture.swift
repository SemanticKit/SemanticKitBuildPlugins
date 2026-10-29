import AST
import Foundation

/// A node, or list of nodes, that a Rego test gives its policy as `input`,
/// with the Swift it was parsed from.
///
/// Each fixture in `Tests/Rego` follows one comment per node:
///
/// ```rego
/// # Parser output for `Button("OK")` at 22:9.
/// some_test_node := {"type": "FunctionCallExprSyntax", ...}
/// ```
struct RegoFixture: CustomStringConvertible {
    struct Origin {
        /// The Swift the node was parsed from; `nil` for an empty file.
        let swift: String?
        let line: Int
        let column: Int

        /// The Swift placed so that it starts at `line`:`column`.
        var source: String {
            guard let swift else { return "" }
            return String(repeating: "\n", count: line - 1) + String(repeating: " ", count: column - 1) + swift
        }
    }

    let file: String
    let package: String
    let name: String
    let origins: [Origin]

    var description: String { "\(file): \(name)" }

    /// Every fixture of every `*_test.rego` file under `Tests/Rego`.
    static func all() throws -> [RegoFixture] {
        let directory = Repository.url("Tests/Rego")
        guard let files = FileManager.default.enumerator(at: directory, includingPropertiesForKeys: nil) else { return [] }
        return try files.compactMap { $0 as? URL }
            .filter { $0.lastPathComponent.hasSuffix("_test.rego") }
            .sorted { $0.path < $1.path }
            .flatMap { try fixtures(in: $0) }
    }

    private static func fixtures(in file: URL) throws -> [RegoFixture] {
        let lines = try String(contentsOf: file, encoding: .utf8).split(separator: "\n", omittingEmptySubsequences: false)
        guard let package = lines.first(where: { $0.hasPrefix("package ") })?.dropFirst("package ".count) else { return [] }
        let relativePath = String(file.path.dropFirst(Repository.root.path.count + 1))

        var fixtures: [RegoFixture] = []
        var origins: [Origin] = []
        for line in lines {
            if let origin = origin(of: line) {
                origins.append(origin)
            } else if !origins.isEmpty {
                let name = line.prefix { $0.isLetter || $0.isNumber || $0 == "_" }
                if !name.isEmpty, line.dropFirst(name.count).hasPrefix(" := ") {
                    fixtures.append(RegoFixture(file: relativePath, package: String(package), name: String(name), origins: origins))
                }
                origins = []
            }
        }
        return fixtures
    }

    /// The origin a `# Parser output for `<swift>` at <line>:<column>.` comment names.
    private static func origin(of line: Substring) -> Origin? {
        let prefix = "# Parser output for `"
        guard line.hasPrefix(prefix) else { return nil }
        if line == "# Parser output for `(an empty file)`" {
            return Origin(swift: nil, line: 1, column: 1)
        }
        guard line.hasSuffix("."), let at = line.range(of: "` at ", options: .backwards) else { return nil }
        let position = line[at.upperBound...].dropLast().split(separator: ":")
        guard position.count == 2, let row = Int(position[0]), let column = Int(position[1]) else { return nil }
        return Origin(swift: String(line[line.index(line.startIndex, offsetBy: prefix.count)..<at.lowerBound]), line: row, column: column)
    }

    /// The value of every fixture, read with one `opa eval`, in the order of `fixtures`.
    static func values(of fixtures: [RegoFixture]) throws -> [AST.RegoValue] {
        let query = "[" + fixtures.map { "data.\($0.package).\($0.name)" }.joined(separator: ", ") + "]"
        let output = try Repository.run(try Repository.opa, [
            "eval", "--format", "raw",
            "--data", Repository.url("Sources").path,
            "--data", Repository.url("Tests/Rego").path,
            query,
        ])
        guard case .array(let values) = try AST.RegoValue(jsonData: output), values.count == fixtures.count else {
            throw UnexpectedFixtureValues()
        }
        return values
    }
}

private struct UnexpectedFixtureValues: Error, CustomStringConvertible {
    var description: String { "opa eval did not return one value per fixture" }
}
