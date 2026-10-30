import AST
import SwiftSyntax

/// A syntax node that policies read as a Rego value.
///
/// The value is an object whose keys are the node's own property names in
/// swift-syntax (`calledExpression`, `arguments`, `bindingSpecifier`,
/// `bindings`, `pattern`, ...), plus `range`, the node's 1-based start and
/// end without trivia. A child that is one of several kinds of node, such as
/// an `ExprSyntax`, is an object with one key: the name of its case in
/// swift-syntax's own enum for that kind (`ExprSyntaxEnum.functionCallExpr`
/// is `{"functionCallExpr": {...}}`). A token is its text. A property that is
/// `nil` or an empty list is left out.
protocol RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue
}

extension SyntaxProtocol {
    /// `{"start": {"line", "column"}, "end": {"line", "column"}}`, without trivia.
    func regoRange(_ locations: SourceLocationConverter) -> AST.RegoValue {
        let start = locations.location(for: positionAfterSkippingLeadingTrivia)
        let end = locations.location(for: endPositionBeforeTrailingTrivia)
        return ["start": Self.regoPosition(start), "end": Self.regoPosition(end)]
    }

    /// An object of the node's `range` and `properties`, leaving out each
    /// property that is `nil` or an empty list.
    func regoObject(_ locations: SourceLocationConverter, _ properties: KeyValuePairs<String, AST.RegoValue?>) -> AST.RegoValue {
        var object: [AST.RegoValue: AST.RegoValue] = ["range": regoRange(locations)]
        for (key, value) in properties {
            guard let value else { continue }
            if case .array(let elements) = value, elements.isEmpty { continue }
            object[.string(key)] = value
        }
        return .object(object)
    }

    private static func regoPosition(_ location: SourceLocation) -> AST.RegoValue {
        ["line": .number(RegoNumber(value: location.line)), "column": .number(RegoNumber(value: location.column))]
    }
}

extension TokenSyntax {
    /// The token's text: `Button`, `static`, `let`, `+`.
    var regoText: AST.RegoValue { .string(text) }
}

extension SyntaxCollection where Element: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        .array(map { $0.regoInput(locations) })
    }
}

extension Optional where Wrapped: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue? {
        map { $0.regoInput(locations) }
    }
}

extension AST.RegoValue {
    /// The object without `keys`; any other value as it is.
    func removing(_ keys: Set<String>) -> AST.RegoValue {
        guard case .object(var object) = self else { return self }
        for key in keys {
            object[.string(key)] = nil
        }
        return .object(object)
    }

    /// The object with `value` at `key`; any other value as it is.
    func setting(_ key: String, _ value: AST.RegoValue) -> AST.RegoValue {
        guard case .object(var object) = self else { return self }
        object[.string(key)] = value
        return .object(object)
    }

    /// The value at `key` of an object; `nil` for anything else.
    subscript(key: String) -> AST.RegoValue? {
        guard case .object(let object) = self else { return nil }
        return object[.string(key)]
    }
}
