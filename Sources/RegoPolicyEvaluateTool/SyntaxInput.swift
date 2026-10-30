import AST
import Foundation
import SwiftOperators
import SwiftParser
import SwiftSyntax

/// One Swift source file as the `input` its policies read.
///
/// The parser's tree, with its sequence expressions folded by the standard
/// operators, is walked once by a `SyntaxVisitor` (``SyntaxInputVisitor``).
/// `input` holds one list for each kind of node policies look for, named
/// after the node type: `functionCallExprs`, `memberAccessExprs`,
/// `declReferenceExprs`, `stringLiteralExprs`, `infixOperatorExprs`,
/// `dictionaryExprs`, `genericSpecializationExprs`, `macroExpansionExprs`,
/// `returnStmts`, `variableDecls`, `functionDecls`, `initializerDecls`,
/// `enumCaseDecls`, `structDecls`, `classDecls`, `enumDecls`, `actorDecls`,
/// `extensionDecls`, `protocolDecls`, `identifierTypes`, `memberTypes` and
/// `dictionaryTypes`. Every node of that kind in the file is in its list, in
/// source order, with its swift-syntax properties by name (see
/// ``RegoInputConvertible``):
///
/// ```rego
/// some call in input.functionCallExprs
/// call.calledExpression.declReferenceExpr.baseName == "Button"
/// some argument in call.arguments
/// some segment in argument.expression.stringLiteralExpr.segments
/// segment.stringSegment.content == "OK"
/// ```
///
/// Each node in a list also has `context`: the declarations around it,
/// outermost first, each `{"<case>": {...}}` as in a member block, without
/// its `memberBlock`, `body` or the values of its bindings. A list with no
/// nodes is left out.
struct SyntaxInput {
    let value: AST.RegoValue

    init(contentsOf url: URL) throws {
        try self.init(source: String(contentsOf: url, encoding: .utf8), fileName: url.path)
    }

    init(source: String, fileName: String) {
        let parsed = Parser.parse(source: source)
        // A sequence the standard operators cannot fold stays a `sequenceExpr`.
        let tree = OperatorTable.standardOperators.foldAll(parsed) { _ in }
        let visitor = SyntaxInputVisitor(locations: SourceLocationConverter(fileName: fileName, tree: tree))
        visitor.walk(tree)
        value = visitor.input
    }
}
