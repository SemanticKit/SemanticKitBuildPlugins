import AST
import Foundation
import Testing
@testable import RegoPolicyEvaluateTool

@Suite("Ontology vocabulary", .tags(.vocabulary))
struct OntologyVocabularyTests {
    @Test("An ontology's declarations name its terms, and its Prefix declarations its prefixes")
    func declarations() {
        let vocabulary = OntologyVocabulary(source: """
            @Ontology struct Fauna {
                var body: some Content {
                    Prefix("fauna", namespace)
                    Class("Animal") { Label("Animal") }
                    Property("habitat")
                    Individual("tweety")
                    Domain(Fauna.Animal)
                }
            }
            """)

        #expect(vocabulary.ontologies == ["Fauna"])
        #expect(vocabulary.terms == ["Animal", "habitat", "tweety"])
        #expect(vocabulary.prefixes == ["fauna"])
    }

    @Test("Types declared in an ontology, or in an extension of one in any file, are its terms")
    func nestedTypes() {
        let vocabulary = OntologyVocabulary(source: """
            extension Foaf { final class Person {} }
            struct Foaf: RDFKit.Ontology { protocol Agent {} }
            extension Graph { final class Node {} }
            """)

        #expect(vocabulary.ontologies == ["Foaf"])
        #expect(vocabulary.terms == ["Agent", "Person"])
    }

    @Test("Declarations outside an ontology, and names built at run time, are not terms")
    func outsideOntologies() {
        let vocabulary = OntologyVocabulary(source: """
            let animal = Class("Animal")
            struct Fauna: Ontology { var body: some Content { Class("\\(name)"); Class(name) } }
            """)

        #expect(vocabulary.ontologies == ["Fauna"])
        #expect(vocabulary.terms.isEmpty)
    }

    @Test("The vocabulary reads back from the record the build command writes")
    func record() throws {
        let vocabulary = OntologyVocabulary(source: "@Ontology struct Fauna { var body: some Content { Class(\"Animal\") } }")
        let directory = try Repository.temporaryDirectory()
        defer { try? FileManager.default.removeItem(at: directory) }
        let file = directory.appendingPathComponent("RegoPolicyVocabulary.swift")
        try Data(vocabulary.record.utf8).write(to: file)

        #expect(try OntologyVocabulary(record: file) == vocabulary)
        #expect(vocabulary.regoValue == ["ontologies": ["Fauna"], "terms": ["Animal"]])
    }

    @Test("Policies read the vocabulary as input.vocabulary, and only when one is in scope")
    func input() {
        let vocabulary = OntologyVocabulary(source: "@Ontology struct Fauna { var body: some Content { Class(\"Animal\") } }")

        #expect(SyntaxInput(source: "enum Kinds { case animal }", fileName: "Kinds.swift", vocabulary: vocabulary).value["vocabulary"] == vocabulary.regoValue)
        #expect(SyntaxInput(source: "enum Kinds { case animal }", fileName: "Kinds.swift", vocabulary: OntologyVocabulary()).value["vocabulary"] == nil)
    }
}
