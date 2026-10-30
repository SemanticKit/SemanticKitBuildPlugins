import AST
import Testing
@testable import RegoPolicyEvaluateTool

@Suite("SyntaxInput", .tags(.syntaxInput))
struct SyntaxInputTests {
    /// The Rego tests give policies frozen `input`; this keeps that input
    /// what the evaluator gives policies at build time.
    @Test("Every Rego test fixture is the input SyntaxInput writes for its Swift", .tags(.opa))
    func fixturesMatchParserOutput() throws {
        let fixtures = try RegoFixture.all()
        #expect(fixtures.count > 150)
        let values = try RegoFixture.values(of: fixtures)

        for (fixture, value) in zip(fixtures, values) {
            let expected: [AST.RegoValue]
            if fixture.origins.count == 1 {
                expected = [value]
            } else if case .array(let documents) = value {
                expected = documents
            } else {
                expected = [value]
            }
            try #require(expected.count == fixture.origins.count, "\(fixture) has \(expected.count) inputs for \(fixture.origins.count) comments")

            for (document, origin) in zip(expected, fixture.origins) {
                let parsed = origin.vocabulary
                    ? OntologyVocabulary(source: origin.source).regoValue
                    : SyntaxInput(source: origin.source, fileName: "Fixture.swift").value
                #expect(parsed == document, "\(fixture): the input for `\(origin.swift ?? "")` at \(origin.line):\(origin.column) differs from the fixture")
            }
        }
    }

    @Test("A call holds its called expression and arguments by their swift-syntax names")
    func callShape() throws {
        let input = SyntaxInput(source: "Text(\"Hi\", bundle: .main)", fileName: "Shape.swift").value
        let call = try #require(input["functionCallExprs"]?.element(0))

        #expect(call["range"] == ["start": ["line": 1, "column": 1], "end": ["line": 1, "column": 26]])
        #expect(call["calledExpression"]?["declReferenceExpr"]?["baseName"] == "Text")
        let text = try #require(call["arguments"]?.element(0))
        #expect(text["label"] == nil)
        #expect(text["expression"]?["stringLiteralExpr"]?["segments"]?.element(0)?["stringSegment"]?["content"] == "Hi")
        let bundle = try #require(call["arguments"]?.element(1))
        #expect(bundle["label"] == "bundle")
        #expect(bundle["expression"]?["memberAccessExpr"]?["base"] == nil)
        #expect(bundle["expression"]?["memberAccessExpr"]?["declName"]?["baseName"] == "main")
    }

    @Test("A variable holds its modifiers, binding specifier and bindings by name")
    func variableShape() throws {
        let input = SyntaxInput(source: "static let shared = Graph()", fileName: "Variable.swift").value
        let variable = try #require(input["variableDecls"]?.element(0))

        #expect(variable["modifiers"]?.element(0)?["name"] == "static")
        #expect(variable["bindingSpecifier"] == "let")
        let binding = try #require(variable["bindings"]?.element(0))
        #expect(binding["pattern"]?["identifierPattern"]?["identifier"] == "shared")
        #expect(binding["typeAnnotation"] == nil)
        #expect(binding["initializer"]?["value"]?["functionCallExpr"]?["calledExpression"]?["declReferenceExpr"]?["baseName"] == "Graph")
    }

    @Test("Operator sequences are folded into infix operations")
    func folding() throws {
        let input = SyntaxInput(source: "let iri = ns + \"knows\" + suffix", fileName: "Fold.swift").value
        let sum = try #require(input["infixOperatorExprs"]?.element(0))

        #expect(sum["operator"]?["binaryOperatorExpr"]?["operator"] == "+")
        #expect(sum["rightOperand"]?["declReferenceExpr"]?["baseName"] == "suffix")
        let inner = try #require(sum["leftOperand"]?["infixOperatorExpr"])
        #expect(inner["leftOperand"]?["declReferenceExpr"]?["baseName"] == "ns")
        #expect(inner["rightOperand"]?["stringLiteralExpr"] != nil)
        #expect(input["sequenceExprs"] == nil)
    }

    @Test("A node's context is the declarations around it, without their contents")
    func context() throws {
        let source = """
            /// Turtle.
            struct TurtleDecoder: Sendable {
                func decode(_ text: String) { resolve(text) }
            }
            """
        let input = SyntaxInput(source: source, fileName: "Context.swift").value
        let call = try #require(input["functionCallExprs"]?.element(0))
        let context = try #require(call["context"])

        let decoder = try #require(context.element(0)?["structDecl"])
        #expect(decoder["name"] == "TurtleDecoder")
        #expect(decoder["documentation"] == "/// Turtle.")
        #expect(decoder["inheritanceClause"]?["inheritedTypes"]?.element(0)?["type"]?["identifierType"]?["name"] == "Sendable")
        #expect(decoder["memberBlock"] == nil)
        let function = try #require(context.element(1)?["functionDecl"])
        #expect(function["name"] == "decode")
        #expect(function["signature"]?["parameterClause"]?["parameters"]?.element(0)?["firstName"] == "_")
        #expect(function["body"] == nil)
        #expect(context.element(2) == nil)

        let declaration = try #require(input["structDecls"]?.element(0))
        #expect(declaration["context"] == nil)
        let member = try #require(declaration["memberBlock"]?["members"]?.element(0)?["decl"]?["functionDecl"])
        #expect(member["body"]?["statements"]?.element(0)?["item"]?["expr"]?["functionCallExpr"] != nil)
    }

    @Test("A list with no nodes is left out, and lists keep source order")
    func lists() throws {
        let input = SyntaxInput(source: "f(g())", fileName: "Order.swift").value
        #expect(input["variableDecls"] == nil)
        guard case .array(let calls)? = input["functionCallExprs"] else {
            Issue.record("no calls")
            return
        }
        #expect(calls.count == 2)
        #expect(calls.first?["calledExpression"]?["declReferenceExpr"]?["baseName"] == "f")
        #expect(calls.last?["calledExpression"]?["declReferenceExpr"]?["baseName"] == "g")
    }
}

extension AST.RegoValue {
    func element(_ index: Int) -> AST.RegoValue? {
        guard case .array(let elements) = self, elements.indices.contains(index) else { return nil }
        return elements[index]
    }
}
