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

    /// The positions in `nodes` of the nodes of each node type.
    private let indicesByType: [String: [Int]]

    init(contentsOf url: URL) throws {
        try self.init(source: String(contentsOf: url, encoding: .utf8), fileName: url.path)
    }

    init(source: String, fileName: String) {
        let tree = Parser.parse(source: source)
        let converter = SourceLocationConverter(fileName: fileName, tree: tree)
        var nodes: [AST.RegoValue] = []
        var indicesByType: [String: [Int]] = [:]
        _ = Self.value(of: Syntax(tree), converter: converter, collecting: &nodes, indicesByType: &indicesByType)
        self.nodes = nodes
        self.indicesByType = indicesByType
    }

    /// The nodes whose type is one of `types`, in pre-order; every node when
    /// `types` is `nil`.
    func nodes(ofTypes types: Set<String>?) -> [AST.RegoValue] {
        guard let types else { return nodes }
        return types.flatMap { indicesByType[$0] ?? [] }.sorted().map { nodes[$0] }
    }

    private static func value(
        of node: Syntax,
        converter: SourceLocationConverter,
        collecting nodes: inout [AST.RegoValue],
        indicesByType: inout [String: [Int]]
    ) -> AST.RegoValue {
        let index = nodes.count
        nodes.append(.null)
        let type = String(describing: node.syntaxNodeType)
        indicesByType[type, default: []].append(index)

        let start = converter.location(for: node.positionAfterSkippingLeadingTrivia)
        let end = converter.location(for: node.endPositionBeforeTrailingTrivia)
        var object: [AST.RegoValue: AST.RegoValue] = [
            "type": .string(type),
            "range": ["start": position(start), "end": position(end)],
            "children": .array(node.children(viewMode: .all).map {
                value(of: $0, converter: converter, collecting: &nodes, indicesByType: &indicesByType)
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
