import AST
import SwiftSyntax

/// A type is `{"<case>": {...}}`, the case of `TypeSyntaxEnum` it is:
/// `{"identifierType": {"name": "IRI"}}`,
/// `{"dictionaryType": {"key": ..., "value": ...}}`.
extension TypeSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        let (name, value): (String, AST.RegoValue) = switch self.as(TypeSyntaxEnum.self) {
        case .arrayType(let node): ("arrayType", node.regoObject(locations, ["element": node.element.regoInput(locations)]))
        case .attributedType(let node): ("attributedType", node.regoObject(locations, [
            "attributes": .array(node.attributes.compactMap { $0.as(AttributeSyntax.self)?.regoInput(locations) }),
            "baseType": node.baseType.regoInput(locations),
        ]))
        case .classRestrictionType(let node): ("classRestrictionType", node.regoObject(locations, [:]))
        case .compositionType(let node): ("compositionType", node.regoObject(locations, [
            "elements": .array(node.elements.map { $0.type.regoInput(locations) }),
        ]))
        case .dictionaryType(let node): ("dictionaryType", node.regoInput(locations))
        case .functionType(let node): ("functionType", node.regoObject(locations, [
            "parameters": .array(node.parameters.map { $0.type.regoInput(locations) }),
            "returnClause": node.returnClause.regoInput(locations),
        ]))
        case .identifierType(let node): ("identifierType", node.regoInput(locations))
        case .implicitlyUnwrappedOptionalType(let node): ("implicitlyUnwrappedOptionalType", node.regoObject(locations, [
            "wrappedType": node.wrappedType.regoInput(locations),
        ]))
        case .inlineArrayType(let node): ("inlineArrayType", node.regoObject(locations, [:]))
        case .memberType(let node): ("memberType", node.regoInput(locations))
        case .metatypeType(let node): ("metatypeType", node.regoObject(locations, [
            "baseType": node.baseType.regoInput(locations),
            "metatypeSpecifier": node.metatypeSpecifier.regoText,
        ]))
        case .missingType(let node): ("missingType", node.regoObject(locations, [:]))
        case .namedOpaqueReturnType(let node): ("namedOpaqueReturnType", node.regoObject(locations, [
            "type": node.type.regoInput(locations),
        ]))
        case .optionalType(let node): ("optionalType", node.regoObject(locations, [
            "wrappedType": node.wrappedType.regoInput(locations),
        ]))
        case .packElementType(let node): ("packElementType", node.regoObject(locations, ["pack": node.pack.regoInput(locations)]))
        case .packExpansionType(let node): ("packExpansionType", node.regoObject(locations, [
            "repetitionPattern": node.repetitionPattern.regoInput(locations),
        ]))
        case .someOrAnyType(let node): ("someOrAnyType", node.regoObject(locations, [
            "someOrAnySpecifier": node.someOrAnySpecifier.regoText,
            "constraint": node.constraint.regoInput(locations),
        ]))
        case .suppressedType(let node): ("suppressedType", node.regoObject(locations, ["type": node.type.regoInput(locations)]))
        case .tupleType(let node): ("tupleType", node.regoObject(locations, [
            "elements": .array(node.elements.map { element in
                element.regoObject(locations, ["firstName": element.firstName?.regoText, "type": element.type.regoInput(locations)])
            }),
        ]))
        }
        return [name: value]
    }
}

/// `{"name", "genericArgumentClause"}`: `IRI`, `Dictionary<IRI, Term>`.
extension IdentifierTypeSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "name": name.regoText,
            "genericArgumentClause": genericArgumentClause.regoInput(locations),
        ])
    }
}

/// `{"baseType", "name", "genericArgumentClause"}`: `IRIKit.IRI`.
extension MemberTypeSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "baseType": baseType.regoInput(locations),
            "name": name.regoText,
            "genericArgumentClause": genericArgumentClause.regoInput(locations),
        ])
    }
}

/// `{"key", "value"}`: `[IRI: Term]`.
extension DictionaryTypeSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["key": key.regoInput(locations), "value": value.regoInput(locations)])
    }
}

/// `{"arguments"}`, each `{"argument"}`: `{"type": ...}` or `{"expr": ...}`,
/// the case of `GenericArgumentSyntax.Argument` it is.
extension GenericArgumentClauseSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["arguments": .array(arguments.map { argument in
            let value: AST.RegoValue = switch argument.argument {
            case .type(let type): ["type": type.regoInput(locations)]
            case .expr(let expr): ["expr": expr.regoInput(locations)]
            }
            return argument.regoObject(locations, ["argument": value])
        })])
    }
}

/// `{"type"}`
extension ReturnClauseSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["type": type.regoInput(locations)])
    }
}

/// `{"type"}`
extension TypeAnnotationSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["type": type.regoInput(locations)])
    }
}

/// `{"inheritedTypes"}`, each `{"type"}`: `: String, CodingKey`.
extension InheritanceClauseSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["inheritedTypes": .array(inheritedTypes.map { inherited in
            inherited.regoObject(locations, ["type": inherited.type.regoInput(locations)])
        })])
    }
}

/// A pattern is `{"<case>": {...}}`, the case of `PatternSyntaxEnum` it is:
/// `{"identifierPattern": {"identifier": "knows"}}`.
extension PatternSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        let (name, value): (String, AST.RegoValue) = switch self.as(PatternSyntaxEnum.self) {
        case .expressionPattern(let node): ("expressionPattern", node.regoObject(locations, [
            "expression": node.expression.regoInput(locations),
        ]))
        case .identifierPattern(let node): ("identifierPattern", node.regoObject(locations, [
            "identifier": node.identifier.regoText,
        ]))
        case .isTypePattern(let node): ("isTypePattern", node.regoObject(locations, ["type": node.type.regoInput(locations)]))
        case .missingPattern(let node): ("missingPattern", node.regoObject(locations, [:]))
        case .tuplePattern(let node): ("tuplePattern", node.regoObject(locations, [
            "elements": .array(node.elements.map { element in
                element.regoObject(locations, ["label": element.label?.regoText, "pattern": element.pattern.regoInput(locations)])
            }),
        ]))
        case .valueBindingPattern(let node): ("valueBindingPattern", node.regoObject(locations, [
            "bindingSpecifier": node.bindingSpecifier.regoText,
            "pattern": node.pattern.regoInput(locations),
        ]))
        case .wildcardPattern(let node): ("wildcardPattern", node.regoObject(locations, [:]))
        }
        return [name: value]
    }
}
