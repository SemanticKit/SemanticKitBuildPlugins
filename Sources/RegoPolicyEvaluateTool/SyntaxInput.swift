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
///
/// Given the ``OntologyVocabulary`` of the target and its dependencies,
/// `input.vocabulary` holds it: `ontologies`, `terms` and `prefixes`, the
/// names the ontologies in scope declare.
struct SyntaxInput {
    let value: AST.RegoValue

    init(contentsOf url: URL, vocabulary: OntologyVocabulary? = nil) throws {
        try self.init(source: String(contentsOf: url, encoding: .utf8), fileName: url.path, vocabulary: vocabulary)
    }

    init(source: String, fileName: String, vocabulary: OntologyVocabulary? = nil) {
        let parsed = Parser.parse(source: source)
        // A sequence the standard operators cannot fold stays a `sequenceExpr`.
        let tree = OperatorTable.standardOperators.foldAll(parsed) { _ in }
        let visitor = SyntaxInputVisitor(locations: SourceLocationConverter(fileName: fileName, tree: tree))
        visitor.walk(tree)
        if let vocabulary, !vocabulary.isEmpty {
            value = visitor.input.setting("vocabulary", vocabulary.regoValue)
        } else {
            value = visitor.input
        }
    }
}
