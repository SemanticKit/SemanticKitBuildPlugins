import AST
import Testing
@testable import RegoPolicyEvaluateTool

@Suite("SyntaxInput", .tags(.syntaxInput))
struct SyntaxInputTests {
    /// The Rego tests give policies frozen parser output; this keeps that
    /// output what the evaluator gives policies at build time.
    @Test("Every Rego test fixture is the node SyntaxInput writes for its Swift", .tags(.opa))
    func fixturesMatchParserOutput() throws {
        let fixtures = try RegoFixture.all()
        #expect(fixtures.count > 150)
        let values = try RegoFixture.values(of: fixtures)

        for (fixture, value) in zip(fixtures, values) {
            let expected: [AST.RegoValue]
            if case .array(let nodes) = value { expected = nodes } else { expected = [value] }
            try #require(expected.count == fixture.origins.count, "\(fixture) has \(expected.count) nodes for \(fixture.origins.count) comments")

            for (node, origin) in zip(expected, fixture.origins) {
                let parsed = SyntaxInput(source: origin.source, fileName: "Fixture.swift").nodes
                #expect(parsed.contains(node), "\(fixture): the parser output for `\(origin.swift ?? "")` at \(origin.line):\(origin.column) differs from the fixture")
            }
        }
    }

    @Test("A node holds its type, range, children and, on tokens, the token kind and text")
    func nodeShape() throws {
        let nodes = SyntaxInput(source: "Text(\"Hi\")", fileName: "Shape.swift").nodes
        let call = try #require(nodes.first { $0.field("type") == "FunctionCallExprSyntax" })

        #expect(call.field("range") == ["start": ["line": 1, "column": 1], "end": ["line": 1, "column": 11]])
        #expect(call.field("token") == nil)
        let callee = try #require(call.child(0))
        #expect(callee.field("type") == "DeclReferenceExprSyntax")
        #expect(callee.child(0)?.field("token") == ["kind": "identifier", "text": "Text"])
        #expect(call.child(1)?.field("token") == ["kind": "leftParen", "text": "("])
    }

    @Test("Nodes come in pre-order, root first, and can be picked by type")
    func nodesByType() throws {
        let input = SyntaxInput(source: "f(g())", fileName: "Order.swift")
        #expect(input.nodes.first?.field("type") == "SourceFileSyntax")

        let calls = input.nodes(ofTypes: ["FunctionCallExprSyntax"])
        #expect(calls.count == 2)
        #expect(calls.first?.field("range") == ["start": ["line": 1, "column": 1], "end": ["line": 1, "column": 7]])
        #expect(input.nodes(ofTypes: nil).count == input.nodes.count)
        #expect(input.nodes(ofTypes: []).isEmpty)
    }
}

extension AST.RegoValue {
    func field(_ key: String) -> AST.RegoValue? {
        guard case .object(let object) = self else { return nil }
        return object[.string(key)]
    }

    func child(_ index: Int) -> AST.RegoValue? {
        guard case .array(let children)? = field("children"), children.indices.contains(index) else { return nil }
        return children[index]
    }
}
