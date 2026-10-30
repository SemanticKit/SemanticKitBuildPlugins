import AST
import Foundation
import SwiftOperators
import SwiftParser
import SwiftSyntax

/// The terms the ontologies of a target and of the targets it depends on
/// declare, which policies read as `input.vocabulary`.
///
/// Nothing here is typed by hand: each name comes from an ontology
/// declaration in Swift, read by ``OntologyVocabularyVisitor``:
///
/// - `ontologies`: the names of the types that are ontologies (`@Ontology`,
///   or conforming to `Ontology`), such as `Fauna`;
/// - `terms`: the names the ontologies declare, `Class("Animal")`,
///   `Property("habitat")`, `Individual("tweety")`, `Datatype(…)`, and the
///   types declared inside an ontology or an extension of one;
/// - `prefixes`: the prefixes their `Prefix("foaf", …)` declarations bind.
///
/// The declarations are read from the Swift source files of the target and
/// of the targets it depends on. SwiftPM does not show a plugin the files
/// other plugins generate, so Swift that a translator plugin writes at build
/// time is not read.
struct OntologyVocabulary: Codable, Equatable {
    var ontologies: Set<String> = []
    var terms: Set<String> = []
    var prefixes: Set<String> = []

    init() {}

    /// The vocabulary the ontologies in `sources` declare.
    init(sources: [URL]) throws {
        let visitor = OntologyVocabularyVisitor()
        for source in sources {
            visitor.walk(Self.tree(try String(contentsOf: source, encoding: .utf8)))
        }
        self = visitor.vocabulary
    }

    /// The vocabulary the ontologies in one source text declare.
    init(source: String) {
        let visitor = OntologyVocabularyVisitor()
        visitor.walk(Self.tree(source))
        self = visitor.vocabulary
    }

    var isEmpty: Bool { ontologies.isEmpty && terms.isEmpty && prefixes.isEmpty }

    /// `{"ontologies": [...], "terms": [...], "prefixes": [...]}`, each sorted;
    /// an empty list is left out.
    var regoValue: AST.RegoValue {
        var object: [AST.RegoValue: AST.RegoValue] = [:]
        for (key, names) in [("ontologies", ontologies), ("terms", terms), ("prefixes", prefixes)] where !names.isEmpty {
            object[.string(key)] = .array(names.sorted().map { .string($0) })
        }
        return .object(object)
    }

    // MARK: The record a build command writes

    /// The vocabulary as the one comment line of a Swift record file, the
    /// output SwiftPM tracks for the command that collects it.
    var record: String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys, .withoutEscapingSlashes]
        let sorted = ["ontologies": ontologies.sorted(), "terms": terms.sorted(), "prefixes": prefixes.sorted()]
        return "// \(String(decoding: (try? encoder.encode(sorted)) ?? Data("{}".utf8), as: UTF8.self))\n"
    }

    /// The vocabulary a record file holds.
    init(record url: URL) throws {
        let line = try String(contentsOf: url, encoding: .utf8)
        guard line.hasPrefix("// ") else { throw InvalidRecord(url: url) }
        self = try JSONDecoder().decode(Self.self, from: Data(line.dropFirst(3).utf8))
    }

    struct InvalidRecord: Error, CustomStringConvertible {
        let url: URL
        var description: String { "\(url.path) is not an ontology vocabulary record" }
    }

    private static func tree(_ source: String) -> Syntax {
        OperatorTable.standardOperators.foldAll(Parser.parse(source: source)) { _ in }
    }
}
