import AST
import SwiftSyntax

/// An expression is `{"<case>": {...}}`, the case of `ExprSyntaxEnum` it is:
/// `{"functionCallExpr": {"calledExpression": ..., "arguments": [...]}}`,
/// `{"stringLiteralExpr": {"segments": [...]}}`.
extension ExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        let (name, value): (String, AST.RegoValue) = switch self.as(ExprSyntaxEnum.self) {
        case .arrayExpr(let node): ("arrayExpr", node.regoInput(locations))
        case .arrowExpr(let node): ("arrowExpr", node.regoObject(locations, [:]))
        case .asExpr(let node): ("asExpr", node.regoInput(locations))
        case .assignmentExpr(let node): ("assignmentExpr", node.regoObject(locations, [:]))
        case .awaitExpr(let node): ("awaitExpr", node.regoObject(locations, ["expression": node.expression.regoInput(locations)]))
        case .binaryOperatorExpr(let node): ("binaryOperatorExpr", node.regoObject(locations, ["operator": node.operator.regoText]))
        case .booleanLiteralExpr(let node): ("booleanLiteralExpr", node.regoObject(locations, ["literal": node.literal.regoText]))
        case .borrowExpr(let node): ("borrowExpr", node.regoObject(locations, ["expression": node.expression.regoInput(locations)]))
        case .closureExpr(let node): ("closureExpr", node.regoInput(locations))
        case .consumeExpr(let node): ("consumeExpr", node.regoObject(locations, ["expression": node.expression.regoInput(locations)]))
        case .copyExpr(let node): ("copyExpr", node.regoObject(locations, ["expression": node.expression.regoInput(locations)]))
        case .declReferenceExpr(let node): ("declReferenceExpr", node.regoInput(locations))
        case .dictionaryExpr(let node): ("dictionaryExpr", node.regoInput(locations))
        case .discardAssignmentExpr(let node): ("discardAssignmentExpr", node.regoObject(locations, [:]))
        case .editorPlaceholderExpr(let node): ("editorPlaceholderExpr", node.regoObject(locations, [:]))
        case .floatLiteralExpr(let node): ("floatLiteralExpr", node.regoObject(locations, ["literal": node.literal.regoText]))
        case .forceUnwrapExpr(let node): ("forceUnwrapExpr", node.regoObject(locations, ["expression": node.expression.regoInput(locations)]))
        case .functionCallExpr(let node): ("functionCallExpr", node.regoInput(locations))
        case .genericSpecializationExpr(let node): ("genericSpecializationExpr", node.regoInput(locations))
        case .ifExpr(let node): ("ifExpr", node.regoInput(locations))
        case .inOutExpr(let node): ("inOutExpr", node.regoObject(locations, ["expression": node.expression.regoInput(locations)]))
        case .infixOperatorExpr(let node): ("infixOperatorExpr", node.regoInput(locations))
        case .integerLiteralExpr(let node): ("integerLiteralExpr", node.regoObject(locations, ["literal": node.literal.regoText]))
        case .isExpr(let node): ("isExpr", node.regoObject(locations, [
            "expression": node.expression.regoInput(locations),
            "type": node.type.regoInput(locations),
        ]))
        case .keyPathExpr(let node): ("keyPathExpr", node.regoObject(locations, ["root": node.root.regoInput(locations)]))
        case .macroExpansionExpr(let node): ("macroExpansionExpr", node.regoInput(locations))
        case .memberAccessExpr(let node): ("memberAccessExpr", node.regoInput(locations))
        case .missingExpr(let node): ("missingExpr", node.regoObject(locations, [:]))
        case .nilLiteralExpr(let node): ("nilLiteralExpr", node.regoObject(locations, [:]))
        case .optionalChainingExpr(let node): ("optionalChainingExpr", node.regoObject(locations, ["expression": node.expression.regoInput(locations)]))
        case .packElementExpr(let node): ("packElementExpr", node.regoObject(locations, ["pack": node.pack.regoInput(locations)]))
        case .packExpansionExpr(let node): ("packExpansionExpr", node.regoObject(locations, ["repetitionPattern": node.repetitionPattern.regoInput(locations)]))
        case .patternExpr(let node): ("patternExpr", node.regoObject(locations, ["pattern": node.pattern.regoInput(locations)]))
        case .postfixIfConfigExpr(let node): ("postfixIfConfigExpr", node.regoObject(locations, ["base": node.base.regoInput(locations)]))
        case .postfixOperatorExpr(let node): ("postfixOperatorExpr", node.regoObject(locations, [
            "expression": node.expression.regoInput(locations),
            "operator": node.operator.regoText,
        ]))
        case .prefixOperatorExpr(let node): ("prefixOperatorExpr", node.regoObject(locations, [
            "operator": node.operator.regoText,
            "expression": node.expression.regoInput(locations),
        ]))
        case .regexLiteralExpr(let node): ("regexLiteralExpr", node.regoObject(locations, ["regex": node.regex.regoText]))
        case .sequenceExpr(let node): ("sequenceExpr", node.regoObject(locations, ["elements": node.elements.regoInput(locations)]))
        case .simpleStringLiteralExpr(let node): ("simpleStringLiteralExpr", node.regoObject(locations, [
            "segments": .array(node.segments.map { $0.regoInput(locations) }),
        ]))
        case .stringLiteralExpr(let node): ("stringLiteralExpr", node.regoInput(locations))
        case .subscriptCallExpr(let node): ("subscriptCallExpr", node.regoObject(locations, [
            "calledExpression": node.calledExpression.regoInput(locations),
            "arguments": node.arguments.regoInput(locations),
        ]))
        case .superExpr(let node): ("superExpr", node.regoObject(locations, [:]))
        case .switchExpr(let node): ("switchExpr", node.regoInput(locations))
        case .ternaryExpr(let node): ("ternaryExpr", node.regoObject(locations, [
            "condition": node.condition.regoInput(locations),
            "thenExpression": node.thenExpression.regoInput(locations),
            "elseExpression": node.elseExpression.regoInput(locations),
        ]))
        case .tryExpr(let node): ("tryExpr", node.regoObject(locations, [
            "questionOrExclamationMark": node.questionOrExclamationMark?.regoText,
            "expression": node.expression.regoInput(locations),
        ]))
        case .tupleExpr(let node): ("tupleExpr", node.regoObject(locations, ["elements": node.elements.regoInput(locations)]))
        case .typeExpr(let node): ("typeExpr", node.regoObject(locations, ["type": node.type.regoInput(locations)]))
        case .unresolvedAsExpr(let node): ("unresolvedAsExpr", node.regoObject(locations, [:]))
        case .unresolvedIsExpr(let node): ("unresolvedIsExpr", node.regoObject(locations, [:]))
        case .unresolvedTernaryExpr(let node): ("unresolvedTernaryExpr", node.regoObject(locations, [
            "thenExpression": node.thenExpression.regoInput(locations),
        ]))
        case .unsafeExpr(let node): ("unsafeExpr", node.regoObject(locations, ["expression": node.expression.regoInput(locations)]))
        // `do` expressions, an experimental feature the parser is not given.
        default: ("doExpr", regoObject(locations, [:]))
        }
        return [name: value]
    }
}

/// `{"calledExpression", "arguments", "trailingClosure", "additionalTrailingClosures"}`
extension FunctionCallExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "calledExpression": calledExpression.regoInput(locations),
            "arguments": arguments.regoInput(locations),
            "trailingClosure": trailingClosure.regoInput(locations),
            "additionalTrailingClosures": additionalTrailingClosures.regoInput(locations),
        ])
    }
}

/// `{"label", "expression"}`: `label` is left out for an unlabeled argument.
extension LabeledExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["label": label?.regoText, "expression": expression.regoInput(locations)])
    }
}

extension MultipleTrailingClosureElementSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["label": label.regoText, "closure": closure.regoInput(locations)])
    }
}

/// `{"base", "declName"}`: `base` is left out for an implicit member, `.red`.
extension MemberAccessExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["base": base?.regoInput(locations), "declName": declName.regoInput(locations)])
    }
}

/// `{"baseName", "argumentNames"}`: `Button`, `init`, `self`.
extension DeclReferenceExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "baseName": baseName.regoText,
            "argumentNames": argumentNames.map { .array($0.arguments.map { $0.name.regoText }) },
        ])
    }
}

/// `{"segments"}`, each `{"stringSegment": {"content"}}` or
/// `{"expressionSegment": {"expressions"}}`.
extension StringLiteralExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["segments": .array(segments.map { segment in
            switch segment {
            case .stringSegment(let text): ["stringSegment": text.regoInput(locations)]
            case .expressionSegment(let expression): ["expressionSegment": expression.regoObject(locations, [
                "expressions": expression.expressions.regoInput(locations),
            ])]
            }
        })])
    }
}

extension StringSegmentSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["content": content.regoText])
    }
}

/// `{"leftOperand", "operator", "rightOperand"}`, from folding the file's
/// sequence expressions with the standard operators.
extension InfixOperatorExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "leftOperand": leftOperand.regoInput(locations),
            "operator": `operator`.regoInput(locations),
            "rightOperand": rightOperand.regoInput(locations),
        ])
    }
}

/// `{"elements"}`, each `{"key", "value"}`; no elements for `[:]`.
extension DictionaryExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        let elements: AST.RegoValue? = switch content {
        case .colon: nil
        case .elements(let elements): .array(elements.map { element in
            element.regoObject(locations, ["key": element.key.regoInput(locations), "value": element.value.regoInput(locations)])
        })
        }
        return regoObject(locations, ["elements": elements])
    }
}

extension ArrayExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["elements": .array(elements.map { $0.expression.regoInput(locations) })])
    }
}

/// `{"expression", "genericArgumentClause": {"arguments": [{"argument"}]}}`
extension GenericSpecializationExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "expression": expression.regoInput(locations),
            "genericArgumentClause": genericArgumentClause.regoInput(locations),
        ])
    }
}

extension AsExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "expression": expression.regoInput(locations),
            "questionOrExclamationMark": questionOrExclamationMark?.regoText,
            "type": type.regoInput(locations),
        ])
    }
}

/// `{"statements"}`
extension ClosureExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["statements": statements.regoInput(locations)])
    }
}

/// `{"macroName", "arguments", "trailingClosure"}`: `#Preview { ... }`.
extension MacroExpansionExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "macroName": macroName.regoText,
            "arguments": arguments.regoInput(locations),
            "trailingClosure": trailingClosure.regoInput(locations),
            "additionalTrailingClosures": additionalTrailingClosures.regoInput(locations),
        ])
    }
}

/// `{"conditions", "body", "elseBody"}`: `elseBody` is `{"ifExpr": ...}` or
/// `{"codeBlock": {"statements"}}`.
extension IfExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        let elseValue: AST.RegoValue? = switch elseBody {
        case .ifExpr(let node): ["ifExpr": node.regoInput(locations)]
        case .codeBlock(let block): ["codeBlock": block.regoInput(locations)]
        case nil: nil
        }
        return regoObject(locations, [
            "conditions": conditions.regoInput(locations),
            "body": body.regoInput(locations),
            "elseBody": elseValue,
        ])
    }
}

/// `{"subject", "cases"}`, each case `{"statements"}`.
extension SwitchExprSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "subject": subject.regoInput(locations),
            "cases": .array(cases.compactMap { $0.as(SwitchCaseSyntax.self) }.map { switchCase in
                switchCase.regoObject(locations, ["statements": switchCase.statements.regoInput(locations)])
            }),
        ])
    }
}

/// `{"condition"}`: `{"expression": ...}` for a Boolean condition, and the
/// initializer of an `if let`, `{"optionalBinding": {"pattern", "initializer"}}`.
extension ConditionElementSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        let value: AST.RegoValue = switch condition {
        case .expression(let expression): ["expression": expression.regoInput(locations)]
        case .optionalBinding(let binding): ["optionalBinding": binding.regoObject(locations, [
            "pattern": binding.pattern.regoInput(locations),
            "initializer": binding.initializer.regoInput(locations),
        ])]
        case .availability: ["availability": regoObject(locations, [:])]
        case .matchingPattern(let pattern): ["matchingPattern": pattern.regoObject(locations, [
            "initializer": pattern.initializer.regoInput(locations),
        ])]
        }
        return regoObject(locations, ["condition": value])
    }
}

/// `{"statements"}`
extension CodeBlockSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["statements": statements.regoInput(locations)])
    }
}
