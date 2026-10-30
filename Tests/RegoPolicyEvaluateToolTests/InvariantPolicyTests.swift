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
    ]

    /// The same file once each banned shape is replaced by the intended one.
    static let intended = """
        struct Foaf: Ontology {}
        struct ACL: Ontology {}
        var counts: [Fauna.Habitat: Int] = [:]
        final class Fauna {}
        let iri = Fauna.Animal.iri
        let graph = Graph()
        let keys = alice.key
        let foo = Class("Foo") { Label("Foo"); Comment("A foo.") }
        let domain = Domain(Fauna.Animal)
        enum TextDirection { case ltr, rtl }
        extension Fauna.Animal { static var iri: IRI { Fauna.namespace.iri } }
        extension Graph { static let empty = Graph() }
        var counts = [Fauna.Habitat: Int]()
        let mode = authorization.mode
        let agentClass = authorization.agentClass
        let range = Range(Fauna.Habitat)
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
