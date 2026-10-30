import Foundation
import Testing
@testable import RegoPolicyEvaluateTool

/// The SemanticKitDesignGuidelines policies run the way `RegoPolicyEvaluate`
/// runs them in a `swift build`: a Swift file with each banned shape fails
/// with the rule that names it, and the same file passes once they are gone.
@Suite("SemanticKit invariants", .tags(.invariants, .evaluation, .opa))
struct InvariantPolicyTests {
    /// One banned shape per line, each named by the rule it breaks.
    static let banned: [(swift: String, rule: String, column: Int)] = [
        ("enum Foaf { static let knows = Term(\"knows\") }", "no_static_term_enum", 1),
        ("struct ACL { static let readClass = IRI(\"http://www.w3.org/ns/auth/acl#Read\") }", "no_static_iri_constant", 14),
        ("var terms: [IRI: Term] = [:]", "no_term_registry", 12),
        ("final class TermRegistry {}", "no_term_registry", 1),
        ("let iri = IRI(rawValue: \"\\(namespace)\\(name)\")", "no_interpolated_identity", 11),
        ("let graph = IndividualGraph()", "no_individual_graph", 13),
        ("let keys = Cert.key.values(of: alice)", "no_values_of_lookup", 12),
        ("let foo = Class(\"Foo\").addLabel(\"Foo\").addComment(\"A foo.\")", "no_add_modifier_on_declaration", 11),
        ("let domain = Domain(\"Animal\")", "no_term_reference_by_name", 14),
        ("enum FoafTerm: String { case knows, person }", "no_static_term_enum", 1),
        ("extension Foaf { static let knows = Term(\"knows\") }", "no_static_term_enum", 1),
        ("struct Foaf { static let knows = Property(\"knows\") }", "no_static_term_enum", 1),
        ("enum Foaf { static func knows() -> Term { Term() } }", "no_static_term_enum", 1),
        ("struct ACL { static let readClass = try! IRI(validating: \"http://www.w3.org/ns/auth/acl#Read\") }", "no_static_iri_constant", 14),
        ("struct ACL { static let readClass: IRI? = nil }", "no_static_iri_constant", 14),
        ("var terms = Dictionary<IRI, Term>()", "no_term_registry", 13),
        ("var terms = [IRI: Term].init()", "no_term_registry", 13),
        ("var terms: [Swift.String: Term] = [:]", "no_term_registry", 12),
        ("var terms: Swift.Dictionary<IRIKit.IRI, Term> = [:]", "no_term_registry", 12),
        ("let keys = values(of: alice)", "no_values_of_lookup", 12),
        ("let mode = ACL.readClass", "no_class_value_constant", 12),
        ("let domain = Domain(Fauna.Animal.iri)", "no_term_reference_by_name", 14),
        ("let range = Range(try! IRI(validating: \"http://example.org/fauna#Habitat\"))", "no_term_reference_by_name", 13),
        ("let terms = [\"knows\": Knows(), \"name\": Name()]", "no_term_registry", 13),
        ("var byURL: [URL: Term] = [:]", "no_term_registry", 12),
        ("let terms = [IRI(\"http://xmlns.com/foaf/0.1/knows\"): Knows()]", "no_term_registry", 13),
        ("let iri = IRI.init(rawValue: \"\\(namespace)\\(name)\")", "no_interpolated_identity", 11),
        ("let iri = IRIKit.IRI(rawValue: \"\\(namespace)\\(name)\")", "no_interpolated_identity", 11),
        ("let range = Range(\"http://www.w3.org/2001/XMLSchema#\" + \"nonNegativeInteger\")", "no_term_reference_by_name", 13),
        ("enum Foaf: String { case knows = \"http://xmlns.com/foaf/0.1/knows\" }", "no_static_term_enum", 1),
        // The bypasses FoafA to FoafD: a static term IRI however it is built.
        ("enum FoafA { static let knows = URL(string: \"http://xmlns.com/foaf/0.1/knows\")! }", "no_static_iri_constant", 14),
        ("enum FoafB { static let knows = \"\\(ns)knows\" }", "no_static_iri_constant", 14),
        ("enum FoafC { static let knows = ns + \"knows\" }", "no_static_iri_constant", 14),
        ("struct FoafD { static let knows = NamedNode(\"http://xmlns.com/foaf/0.1/knows\") }", "no_static_iri_constant", 16),
        ("enum Foaf { case knows, person, agent }", "no_static_term_enum", 1),
        ("/** The FOAF vocabulary. */ enum Friend { case knows, person }", "no_static_term_enum", 29),
        ("enum Fauna { static let animal = Animal() }", "no_static_term_enum", 1),
        ("struct Fauna { static let namespace = Namespace(\"https://fauna.example.org/ontology#\") }", "no_static_iri_constant", 16),
        ("extension Prefix { static let owl = Prefix(\"owl\", \"http://www.w3.org/2002/07/owl#\") }", "no_static_iri_constant", 20),
        ("enum ACL { static var read: URL { URL(string: \"http://www.w3.org/ns/auth/acl#Read\")! } }", "no_static_iri_constant", 12),
        ("let r = TermRegistry.shared", "no_term_registry", 9),
        ("let iri = URL(string: \"\\(base)knows\")", "no_interpolated_identity", 11),
        ("let term = Term(\"http://example.org/\" + name)", "no_interpolated_identity", 12),
        ("let knows = \"\\(namespace)knows\"", "no_interpolated_identity", 13),
        ("struct Fauna: Ontology { func content() -> some Content { Namespace(\"https://fauna.example.org/ontology#\") } }", "no_content_function", 26),
        ("let subclass = SubClassOf<Animal>()", "no_term_reference_by_name", 16),
        ("let domain = Domain(Animal.self)", "no_term_reference_by_name", 14),
        ("private func decodeTerm(_ token: String, tsvMode: Bool) throws -> ObjectTerm { fatalError() }", "no_mode_flag_helper", 1),
        ("func parseLiteral(_ text: String, strict: Bool) -> Literal? { nil }", "no_mode_flag_helper", 1),
        ("struct NTriplesParser { fileprivate func encodeTerm(_ term: Term, turtle: Bool) -> String { \"\" } }", "no_mode_flag_helper", 25),
        ("struct TurtleParser { func resolve(_ local: String) -> IRI? { IRI(string: namespace + local) } }", "no_interpolated_identity", 63),
        // An IRI built by a string-building call, not only by `+` or interpolation.
        ("let iri = IRI(string: ns.appending(\"knows\"))", "no_interpolated_identity", 11),
        ("let iri = IRI(string: String(format: \"%@knows\", ns))", "no_interpolated_identity", 11),
        ("struct Paths { static let knows = [ns, \"knows\"].joined() }", "no_static_iri_constant", 16),
        // A file-scope IRI constant, a type's own static IRI (DESIGN-CONTRACT.md
        // rule 17), static factories and URL paths, `.init` and nested `.self`
        // spellings, String-labelled coders, private-extension and optional
        // flags, other IRI and String key types, and vocabulary case names.
        ("let knows = IRI(rawValue: \"http://xmlns.com/foaf/0.1/knows\")", "no_static_iri_constant", 1),
        ("let knowsURL = URL(string: \"http://xmlns.com/foaf/0.1/knows\")!", "no_static_iri_constant", 1),
        ("func knows() -> IRI { IRI(rawValue: \"http://xmlns.com/foaf/0.1/knows\") }", "no_static_iri_constant", 1),
        ("struct Social { static let knows = IRI.foaf(\"knows\") }", "no_static_iri_constant", 17),
        ("struct Social8 { static let knows = Term.named(\"knows\") }", "no_static_term_enum", 1),
        ("struct Social2 { static let knows = ns + local }", "no_static_iri_constant", 18),
        ("struct Social3 { static let knows = ns.appending(path: \"knows\") }", "no_static_iri_constant", 18),
        ("struct Social4 { static let knows = ns.appendingPathComponent(\"knows\") }", "no_static_iri_constant", 18),
        ("extension Fauna.Animal { static var iri: IRI { Fauna.namespace.iri } }", "no_static_iri_constant", 26),
        ("let s = SubClassOf<Fauna.Animal>.init()", "no_term_reference_by_name", 9),
        ("let p = SubPropertyOf<Fauna.knows>.init()", "no_term_reference_by_name", 9),
        ("let d = Domain((Animal.self))", "no_term_reference_by_name", 9),
        ("let d2 = Domain(Animal.self as Any.Type)", "no_term_reference_by_name", 10),
        ("extension Person { init(from name: String) { self.id = IRI(rawValue: \"\\(ns)\\(name)\") } }", "no_interpolated_identity", 56),
        ("extension Person { func encode(to name: String) -> IRI { IRI(rawValue: \"\\(ns)\\(name)\") } }", "no_interpolated_identity", 58),
        ("private extension TSVParser { func decodeTerm(_ token: String, tsvMode: Bool) -> Term { fatalError() } }", "no_mode_flag_helper", 31),
        ("func decodeTerm(_ token: String, tsvMode: Bool?) -> Term { fatalError() }", "no_mode_flag_helper", 1),
        ("var byNode: [NamedNode: Term] = [:]", "no_term_registry", 13),
        ("var byURI: [URI: Term] = [:]", "no_term_registry", 12),
        ("var registry = [String: any Term.Type]()", "no_term_registry", 16),
        ("var bySubstring: [Substring: Term] = [:]", "no_term_registry", 18),
        ("enum Relation { case knows, person, agent }", "no_static_term_enum", 1),
        ("enum Social5: String { case knows, person }", "no_static_term_enum", 1),
        ("struct Social6 { static let friend = Knows() }", "no_static_term_enum", 1),
        ("struct Social7 { static func knows() -> IRI { IRI(rawValue: \"http://xmlns.com/foaf/0.1/knows\") } }", "no_static_iri_constant", 18),
        ("let d3 = Domain.init(Animal.self)", "no_term_reference_by_name", 10),
    ]

    /// The same file once each banned shape is replaced by the intended one.
    static let intended = """
        struct Foaf: Ontology {}
        struct ACL: Ontology {}
        var counts: [Fauna.Habitat: Int] = [:]
        final class Fauna {}
        let graph = Graph()
        let keys = alice.key
        let foo = Class("Foo") { Label("Foo"); Comment("A foo.") }
        let domain = Domain(Fauna.Animal)
        enum TextDirection { case ltr, rtl }
        extension Graph { static let empty = Graph() }
        var counts = [Fauna.Habitat: Int]()
        let mode = authorization.mode
        let agentClass = authorization.agentClass
        let range = Range(Fauna.Habitat)
        struct Person: Codable { let name: String; enum CodingKeys: String, CodingKey { case name = "foaf_name" } }
        public enum BaseDirection: String, Sendable, Codable { case ltr, rtl }
        struct Format { static let mediaType = "text/turtle" }
        var headers: [String: String] = [:]
        let accept = ["Accept": "text/turtle"]
        var tally: [String: Int] = [:]
        let dataset = Dataset().addGraph(graph)
        struct Fauna: Ontology { var body: some Content { Namespace("https://fauna.example.org/ontology#") } }
        /** The base direction of a literal. */ enum Direction { case ltr, rtl }
        enum Limits { static var depth: Int { 64 } }
        let greeting = "Hello, \\(name)"
        let path = directory + "/file.txt"
        let r = Range<Int>(uncheckedBounds: (0, 4))
        let r2 = Range<String.Index>(range, in: text)
        let r3 = Range(NSRange(location: 0, length: 2), in: "hello")
        struct TurtleDecoder { func base() -> IRI { IRI(rawValue: "http://xmlns.com/foaf/0.1/")! } }
        extension Person: Decodable { init(from decoder: any Decoder) throws { let iri = "\\(namespace)alice" } }
        struct Contact: Codable { let knows: [Contact]; let person: String; enum CodingKeys: String, CodingKey { case knows, person } }
        enum TriplePosition { case subject, predicate, object }
        func baseURL() -> URL { configuration.url }
        let cache = FileManager.default.temporaryDirectory.appending(path: "cache")
        enum Sort { case name, date }
        let subclass = SubClassOf(Fauna.Animal)
        func content(of url: URL) -> Data { Data() }
        struct TurtleDecoder { func resolve(_ local: String) -> IRI? { IRI(string: namespace + local) } }
        extension NTriplesEncoder { func subject(_ name: String) -> String { return "\\(ns)\\(name)" } }
        extension Person: Encodable { func encode(to encoder: Encoder) throws { let iri = "\\(namespace)alice" } }
        extension ObjectTerm { init(token: String) throws { fatalError() } }
        struct TSVDecoder { func decode(_ text: String) throws -> [ObjectTerm] { [] } }
        struct NTriplesDecoder { static func term(from token: String) throws -> Term { fatalError() } }
        let names = ["a", "b"].joined(separator: ", ")
        let file = url.appending(path: "file.txt")
        let path = directory.appending("/file.txt")
        """

    private func evaluate(_ source: String, named name: String) async throws -> (status: Int32, errors: [String], path: String) {
        let directory = try Repository.temporaryDirectory()
        defer { try? FileManager.default.removeItem(at: directory) }
        let policies = try #require(FileManager.default.enumerator(
            at: Repository.url("Sources/SemanticKitDesignGuidelines"), includingPropertiesForKeys: nil
        )).compactMap { $0 as? URL }.filter { $0.pathExtension == "rego" }
        let file = directory.appendingPathComponent(name)
        try Data(source.utf8).write(to: file)
        let plans = directory.appendingPathComponent("plans").path

        let planned = await RegoPolicyEvaluateTool.run(
            ["plan", "--opa", try Repository.opa.path, "--plans", plans,
             "--record", directory.appendingPathComponent("RegoPolicyPlans.swift").path]
                + policies.flatMap { ["--policy", $0.path] }
        )
        try #require(planned.status == 0, "\(planned.diagnostics)")

        let evaluated = await RegoPolicyEvaluateTool.run(
            ["evaluate", "--plans", plans,
             "--record", directory.appendingPathComponent("RegoPolicyFindings.swift").path,
             "--source", file.path]
        )
        return (evaluated.status, evaluated.diagnostics.filter { $0.contains(": error: ") }, file.path)
    }

    @Test("Each banned shape fails the build with the rule that names it")
    func bannedShapesFail() async throws {
        let source = Self.banned.map(\.swift).joined(separator: "\n") + "\n"
        let result = try await evaluate(source, named: "Banned.swift")

        #expect(result.status == 1)
        let found = Set(result.errors.compactMap { diagnostic -> String? in
            guard let rule = diagnostic.split(separator: "[").last?.dropLast() else { return nil }
            let position = diagnostic.dropFirst(result.path.count + 1).split(separator: ":").prefix(2).joined(separator: ":")
            return "\(position) \(rule)"
        })
        let expected = Set(Self.banned.enumerated().map { index, shape in
            "\(index + 1):\(shape.column) semantickit.design_guidelines.\(shape.rule)"
        })
        #expect(found == expected)
        #expect(result.errors.count == Self.banned.count)
    }

    @Test("The file passes once the banned shapes are replaced by the intended ones")
    func intendedShapesPass() async throws {
        let result = try await evaluate(Self.intended + "\n", named: "Intended.swift")

        #expect(result.errors.isEmpty)
        #expect(result.status == 0)
    }
}
