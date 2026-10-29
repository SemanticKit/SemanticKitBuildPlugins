import AST
import Foundation
import SwiftParser
import SwiftSyntax

/// The syntax tree of one Swift source file, as the values policies receive
/// as `input`.
///
/// Every node is the parser's own node, written as
/// `{"type", "range": {"start", "end"}, "token"?, "children"}`: `type` is the
/// SwiftSyntax node type (`FunctionCallExprSyntax`), `range` holds 1-based
/// line and column positions without trivia, `token` is present on tokens
/// only and holds the token kind's case name (`identifier`, `stringSegment`,
/// `leftParen`, ...) and the token's text, and `children` are the node's children in source
/// order, as `Syntax.children(viewMode: .all)` lists them.
struct SyntaxInput {
    /// Every node of the tree in pre-order, root first.
    let nodes: [AST.RegoValue]

    init(contentsOf url: URL) throws {
        let source = try String(contentsOf: url, encoding: .utf8)
        let tree = Parser.parse(source: source)
        let converter = SourceLocationConverter(fileName: url.path, tree: tree)
        var nodes: [AST.RegoValue] = []
        _ = Self.value(of: Syntax(tree), converter: converter, collecting: &nodes)
        self.nodes = nodes
    }

    private static func value(
        of node: Syntax,
        converter: SourceLocationConverter,
        collecting nodes: inout [AST.RegoValue]
    ) -> AST.RegoValue {
        let index = nodes.count
        nodes.append(.null)

        let start = converter.location(for: node.positionAfterSkippingLeadingTrivia)
        let end = converter.location(for: node.endPositionBeforeTrailingTrivia)
        var object: [AST.RegoValue: AST.RegoValue] = [
            "type": .string(String(describing: node.syntaxNodeType)),
            "range": ["start": position(start), "end": position(end)],
            "children": .array(node.children(viewMode: .all).map {
                value(of: $0, converter: converter, collecting: &nodes)
            }),
        ]
        if let token = node.as(TokenSyntax.self) {
            object["token"] = [
                "kind": .string(Self.caseName(of: token.tokenKind)),
                "text": .string(token.text),
            ]
        }

        let value = AST.RegoValue.object(object)
        nodes[index] = value
        return value
    }

    /// `identifier` for `.identifier("Button")`, `leftParen` for `.leftParen`.
    private static func caseName(of kind: TokenKind) -> String {
        Mirror(reflecting: kind).children.first?.label ?? String(describing: kind)
    }

    private static func position(_ location: SourceLocation) -> AST.RegoValue {
        ["line": .number(RegoNumber(value: location.line)), "column": .number(RegoNumber(value: location.column))]
    }
}
