import AST
import SwiftSyntax

/// A declaration is `{"<case>": {...}}`, the case of `DeclSyntaxEnum` it is:
/// `{"variableDecl": {"modifiers", "bindingSpecifier", "bindings"}}`.
///
/// A declaration's `documentation` is the text of the `///` and `/** */`
/// comments before it, one comment per line.
extension DeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        let (name, value): (String, AST.RegoValue) = switch self.as(DeclSyntaxEnum.self) {
        case .accessorDecl(let node): ("accessorDecl", node.regoInput(locations))
        case .actorDecl(let node): ("actorDecl", node.regoInput(locations))
        case .associatedTypeDecl(let node): ("associatedTypeDecl", node.regoObject(locations, ["name": node.name.regoText]))
        case .classDecl(let node): ("classDecl", node.regoInput(locations))
        case .deinitializerDecl(let node): ("deinitializerDecl", node.regoObject(locations, ["body": node.body.regoInput(locations)]))
        case .editorPlaceholderDecl(let node): ("editorPlaceholderDecl", node.regoObject(locations, [:]))
        case .enumCaseDecl(let node): ("enumCaseDecl", node.regoInput(locations))
        case .enumDecl(let node): ("enumDecl", node.regoInput(locations))
        case .extensionDecl(let node): ("extensionDecl", node.regoInput(locations))
        case .functionDecl(let node): ("functionDecl", node.regoInput(locations))
        case .ifConfigDecl(let node): ("ifConfigDecl", node.regoInput(locations))
        case .importDecl(let node): ("importDecl", node.regoObject(locations, [
            "path": .array(node.path.map { $0.name.regoText }),
        ]))
        case .initializerDecl(let node): ("initializerDecl", node.regoInput(locations))
        case .macroDecl(let node): ("macroDecl", node.regoObject(locations, ["name": node.name.regoText]))
        case .macroExpansionDecl(let node): ("macroExpansionDecl", node.regoObject(locations, [
            "macroName": node.macroName.regoText,
            "arguments": node.arguments.regoInput(locations),
            "trailingClosure": node.trailingClosure.regoInput(locations),
        ]))
        case .missingDecl(let node): ("missingDecl", node.regoObject(locations, [:]))
        case .operatorDecl(let node): ("operatorDecl", node.regoObject(locations, ["name": node.name.regoText]))
        case .poundSourceLocation(let node): ("poundSourceLocation", node.regoObject(locations, [:]))
        case .precedenceGroupDecl(let node): ("precedenceGroupDecl", node.regoObject(locations, ["name": node.name.regoText]))
        case .protocolDecl(let node): ("protocolDecl", node.regoInput(locations))
        case .structDecl(let node): ("structDecl", node.regoInput(locations))
        case .subscriptDecl(let node): ("subscriptDecl", node.regoInput(locations))
        case .typeAliasDecl(let node): ("typeAliasDecl", node.regoObject(locations, [
            "modifiers": node.modifiers.regoInput(locations),
            "name": node.name.regoText,
            "initializer": node.initializer.regoObject(locations, ["value": node.initializer.value.regoInput(locations)]),
        ]))
        case .unexpectedCodeDecl(let node): ("unexpectedCodeDecl", node.regoObject(locations, [:]))
        case .variableDecl(let node): ("variableDecl", node.regoInput(locations))
        // `using` declarations, an experimental feature the parser is not given.
        default: ("usingDecl", regoObject(locations, [:]))
        }
        return [name: value]
    }
}

extension SyntaxProtocol {
    /// The `///` and `/** */` comments before the node, one per line; `nil`
    /// when there are none.
    var regoDocumentation: AST.RegoValue? {
        let comments = leadingTrivia.compactMap { piece -> String? in
            switch piece {
            case .docLineComment(let text), .docBlockComment(let text): text
            default: nil
            }
        }
        return comments.isEmpty ? nil : .string(comments.joined(separator: "\n"))
    }
}

/// `{"name", "detail"}`: `static`, `private(set)`.
extension DeclModifierSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["name": name.regoText, "detail": detail.map { $0.detail.regoText }])
    }
}

/// `{"attributeName", "arguments"}`: `@Ontology`, `@available(*, deprecated)`.
/// `arguments` holds the labeled arguments of an attribute that has them.
extension AttributeSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        let arguments: AST.RegoValue? = switch arguments {
        case .argumentList(let list): list.regoInput(locations)
        default: nil
        }
        return regoObject(locations, ["attributeName": attributeName.regoInput(locations), "arguments": arguments])
    }
}

extension AttributeListSyntax {
    /// The attributes, without `#if` clauses.
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        .array(compactMap { $0.as(AttributeSyntax.self)?.regoInput(locations) })
    }
}

/// `{"attributes", "modifiers", "bindingSpecifier", "bindings", "documentation"}`:
/// `static let knows: IRI = ...` has the modifier `static`, the binding
/// specifier `let` and one binding.
extension VariableDeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "attributes": attributes.regoInput(locations),
            "modifiers": modifiers.regoInput(locations),
            "bindingSpecifier": bindingSpecifier.regoText,
            "bindings": bindings.regoInput(locations),
            "documentation": regoDocumentation,
        ])
    }
}

/// `{"pattern", "typeAnnotation", "initializer", "accessorBlock"}`:
/// `initializer` is `{"value"}`, `accessorBlock` is `{"accessors"}`.
extension PatternBindingSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "pattern": pattern.regoInput(locations),
            "typeAnnotation": typeAnnotation.regoInput(locations),
            "initializer": initializer.regoInput(locations),
            "accessorBlock": accessorBlock.regoInput(locations),
        ])
    }
}

/// `{"accessors"}`: `{"getter": [statements]}` for `{ ... }`, or
/// `{"accessors": [accessorDecl]}` for `{ get ... set ... }`, the case of
/// `AccessorBlockSyntax.Accessors` it is.
extension AccessorBlockSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        let value: AST.RegoValue = switch accessors {
        case .getter(let statements): ["getter": statements.regoInput(locations)]
        case .accessors(let accessors): ["accessors": accessors.regoInput(locations)]
        }
        return regoObject(locations, ["accessors": value])
    }
}

/// `{"accessorSpecifier", "body"}`: `get { ... }`.
extension AccessorDeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["accessorSpecifier": accessorSpecifier.regoText, "body": body.regoInput(locations)])
    }
}

/// `{"attributes", "modifiers", "name", "genericParameterClause", "signature", "body", "documentation"}`
extension FunctionDeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "attributes": attributes.regoInput(locations),
            "modifiers": modifiers.regoInput(locations),
            "name": name.regoText,
            "genericParameterClause": genericParameterClause.regoInput(locations),
            "signature": signature.regoInput(locations),
            "body": body.regoInput(locations),
            "documentation": regoDocumentation,
        ])
    }
}

/// `{"attributes", "modifiers", "optionalMark", "genericParameterClause", "signature", "body", "documentation"}`
extension InitializerDeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "attributes": attributes.regoInput(locations),
            "modifiers": modifiers.regoInput(locations),
            "optionalMark": optionalMark?.regoText,
            "genericParameterClause": genericParameterClause.regoInput(locations),
            "signature": signature.regoInput(locations),
            "body": body.regoInput(locations),
            "documentation": regoDocumentation,
        ])
    }
}

/// `{"modifiers", "parameterClause", "returnClause", "accessorBlock"}`
extension SubscriptDeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "modifiers": modifiers.regoInput(locations),
            "parameterClause": parameterClause.regoInput(locations),
            "returnClause": returnClause.regoInput(locations),
            "accessorBlock": accessorBlock.regoInput(locations),
        ])
    }
}

/// `{"parameterClause", "effectSpecifiers", "returnClause"}`: `effectSpecifiers`
/// is `{"asyncSpecifier", "throwsSpecifier"}`.
extension FunctionSignatureSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "parameterClause": parameterClause.regoInput(locations),
            "effectSpecifiers": effectSpecifiers.map { specifiers in
                specifiers.regoObject(locations, [
                    "asyncSpecifier": specifiers.asyncSpecifier?.regoText,
                    "throwsSpecifier": specifiers.throwsClause?.throwsSpecifier.regoText,
                ])
            },
            "returnClause": returnClause.regoInput(locations),
        ])
    }
}

/// `{"parameters"}`
extension FunctionParameterClauseSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["parameters": parameters.regoInput(locations)])
    }
}

/// `{"attributes", "modifiers", "firstName", "secondName", "type", "defaultValue"}`:
/// `_ token: String` has the first name `_` and the second name `token`;
/// `defaultValue` is `{"value"}`.
extension FunctionParameterSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "attributes": attributes.regoInput(locations),
            "modifiers": modifiers.regoInput(locations),
            "firstName": firstName.regoText,
            "secondName": secondName?.regoText,
            "type": type.regoInput(locations),
            "defaultValue": defaultValue.regoInput(locations),
        ])
    }
}

/// `{"parameters"}`, each `{"name", "inheritedType"}`: `<T: Term>`.
extension GenericParameterClauseSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["parameters": .array(parameters.map { parameter in
            parameter.regoObject(locations, [
                "name": parameter.name.regoText,
                "inheritedType": parameter.inheritedType.regoInput(locations),
            ])
        })])
    }
}

/// `{"attributes", "modifiers", "elements", "documentation"}`, each element
/// `{"name", "parameterClause", "rawValue"}`; `rawValue` is `{"value"}`.
extension EnumCaseDeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, [
            "attributes": attributes.regoInput(locations),
            "modifiers": modifiers.regoInput(locations),
            "elements": .array(elements.map { element in
                element.regoObject(locations, [
                    "name": element.name.regoText,
                    "parameterClause": element.parameterClause.map { clause in
                        clause.regoObject(locations, ["parameters": .array(clause.parameters.map { parameter in
                            parameter.regoObject(locations, [
                                "firstName": parameter.firstName?.regoText,
                                "type": parameter.type.regoInput(locations),
                            ])
                        })])
                    },
                    "rawValue": element.rawValue.regoInput(locations),
                ])
            }),
            "documentation": regoDocumentation,
        ])
    }
}

/// `{"members"}`, each `{"decl"}`.
extension MemberBlockSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["members": .array(members.map { member in
            member.regoObject(locations, ["decl": member.decl.regoInput(locations)])
        })])
    }
}

/// `{"clauses"}`, each `{"condition", "elements"}`: the declarations or
/// statements of an `#if` clause.
extension IfConfigDeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["clauses": .array(clauses.map { clause in
            let elements: AST.RegoValue? = switch clause.elements {
            case .statements(let statements): ["statements": statements.regoInput(locations)]
            case .decls(let members): ["decls": .array(members.map { $0.decl.regoInput(locations) })]
            default: nil
            }
            return clause.regoObject(locations, ["condition": clause.condition?.regoInput(locations), "elements": elements])
        })])
    }
}

/// The properties every type declaration shares: `{"attributes", "modifiers",
/// "name", "genericParameterClause", "inheritanceClause", "memberBlock",
/// "documentation"}`.
extension DeclGroupSyntax {
    func regoDeclGroup(_ locations: SourceLocationConverter, name: TokenSyntax?, genericParameterClause: GenericParameterClauseSyntax?) -> AST.RegoValue {
        regoObject(locations, [
            "attributes": attributes.regoInput(locations),
            "modifiers": modifiers.regoInput(locations),
            "name": name?.regoText,
            "genericParameterClause": genericParameterClause.regoInput(locations),
            "inheritanceClause": inheritanceClause.regoInput(locations),
            "memberBlock": memberBlock.regoInput(locations),
            "documentation": regoDocumentation,
        ])
    }
}

extension StructDeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoDeclGroup(locations, name: name, genericParameterClause: genericParameterClause)
    }
}

extension ClassDeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoDeclGroup(locations, name: name, genericParameterClause: genericParameterClause)
    }
}

extension EnumDeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoDeclGroup(locations, name: name, genericParameterClause: genericParameterClause)
    }
}

extension ActorDeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoDeclGroup(locations, name: name, genericParameterClause: genericParameterClause)
    }
}

extension ProtocolDeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoDeclGroup(locations, name: name, genericParameterClause: nil)
    }
}

/// A type declaration's properties with `extendedType` in place of `name`.
extension ExtensionDeclSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoDeclGroup(locations, name: nil, genericParameterClause: nil)
            .setting("extendedType", extendedType.regoInput(locations))
    }
}

/// `{"value"}`: `= Term("knows")`.
extension InitializerClauseSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["value": value.regoInput(locations)])
    }
}
