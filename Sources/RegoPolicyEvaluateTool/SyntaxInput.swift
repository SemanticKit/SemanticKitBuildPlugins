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
/// `leftParen`, ...), the token's text and, after documentation comments,
/// `documentation`, and `children` are the node's children in source
/// order, as `Syntax.children(viewMode: .all)` lists them. A token's
/// `documentation` is the text of the `///` and `/** */` comments before it,
/// one comment per line, so that a policy can read what a declaration is
/// documented as.
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
            var fields: [AST.RegoValue: AST.RegoValue] = [
                "kind": .string(Self.caseName(of: token.tokenKind)),
                "text": .string(token.text),
            ]
            if let documentation = Self.documentation(before: token) {
                fields["documentation"] = .string(documentation)
            }
            object["token"] = .object(fields)
        }

        let value = AST.RegoValue.object(object)
        nodes[index] = value
        return value
    }

    /// The documentation comments in the token's leading trivia, one per line;
    /// `nil` when there are none.
    private static func documentation(before token: TokenSyntax) -> String? {
        let comments = token.leadingTrivia.compactMap { piece -> String? in
            switch piece {
            case .docLineComment(let text), .docBlockComment(let text): text
            default: nil
            }
        }
        return comments.isEmpty ? nil : comments.joined(separator: "\n")
    }

    /// `identifier` for `.identifier("Button")`, `leftParen` for `.leftParen`.
    private static func caseName(of kind: TokenKind) -> String {
        Mirror(reflecting: kind).children.first?.label ?? String(describing: kind)
    }

    private static func position(_ location: SourceLocation) -> AST.RegoValue {
        ["line": .number(RegoNumber(value: location.line)), "column": .number(RegoNumber(value: location.column))]
    }
}
