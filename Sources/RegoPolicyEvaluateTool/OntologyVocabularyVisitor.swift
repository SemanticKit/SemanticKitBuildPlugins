import SwiftSyntax

/// Walks source files and collects the ``OntologyVocabulary`` their
/// ontologies declare.
///
/// An ontology is a struct, class, enum or actor marked `@Ontology` or
/// conforming to `Ontology`. Inside one, a call of a declaration kind of the
/// DSL (`Class`, `Property`, `Individual`, `Datatype`, `ObjectProperty`,
/// `DatatypeProperty`, `AnnotationProperty`) whose first argument is a plain
/// string literal declares that term, and `Prefix("foaf", …)` binds that
/// prefix. A type declared inside an ontology, or inside an extension of one
/// in any of the files walked, is a term too.
final class OntologyVocabularyVisitor: SyntaxVisitor {
    private(set) var ontologies: Set<String> = []
    private var terms: Set<String> = []
    private var prefixes: Set<String> = []
    /// The types declared in each extension, by the name of the type it
    /// extends; terms once that type is known to be an ontology.
    private var extensionMembers: [String: Set<String>] = [:]
    /// How many ontologies the visitor is inside.
    private var depth = 0

    /// The DSL's declaration kinds, whose first argument names the term.
    private static let declarationKinds: Set<String> = [
        "Class", "Property", "Individual", "Datatype",
        "ObjectProperty", "DatatypeProperty", "AnnotationProperty",
    ]

    init() {
        super.init(viewMode: .sourceAccurate)
    }

    var vocabulary: OntologyVocabulary {
        var vocabulary = OntologyVocabulary()
        vocabulary.ontologies = ontologies
        vocabulary.terms = terms.union(extensionMembers.filter { ontologies.contains($0.key) }.values.flatMap { $0 })
        vocabulary.prefixes = prefixes
        return vocabulary
    }

    // MARK: Ontologies

    override func visit(_ node: StructDeclSyntax) -> SyntaxVisitorContinueKind {
        enter(node.name, node.attributes, node.inheritanceClause)
    }

    override func visitPost(_ node: StructDeclSyntax) { leave(node.attributes, node.inheritanceClause) }

    override func visit(_ node: ClassDeclSyntax) -> SyntaxVisitorContinueKind {
        enter(node.name, node.attributes, node.inheritanceClause)
    }

    override func visitPost(_ node: ClassDeclSyntax) { leave(node.attributes, node.inheritanceClause) }

    override func visit(_ node: EnumDeclSyntax) -> SyntaxVisitorContinueKind {
        enter(node.name, node.attributes, node.inheritanceClause)
    }

    override func visitPost(_ node: EnumDeclSyntax) { leave(node.attributes, node.inheritanceClause) }

    override func visit(_ node: ActorDeclSyntax) -> SyntaxVisitorContinueKind {
        enter(node.name, node.attributes, node.inheritanceClause)
    }

    override func visitPost(_ node: ActorDeclSyntax) { leave(node.attributes, node.inheritanceClause) }

    override func visit(_ node: ProtocolDeclSyntax) -> SyntaxVisitorContinueKind {
        declare(node.name)
        return .visitChildren
    }

    /// `extension Fauna { final class Animal {} }`
    override func visit(_ node: ExtensionDeclSyntax) -> SyntaxVisitorContinueKind {
        guard let extended = node.extendedType.as(IdentifierTypeSyntax.self)?.name.text else { return .visitChildren }
        for member in node.memberBlock.members {
            if let name = Self.typeName(of: member.decl) {
                extensionMembers[extended, default: []].insert(name)
            }
        }
        return .visitChildren
    }

    // MARK: Declarations

    /// `Class("Animal")`, `Property("habitat") { … }`, `Prefix("foaf", "…")`
    override func visit(_ node: FunctionCallExprSyntax) -> SyntaxVisitorContinueKind {
        guard depth > 0,
              let callee = node.calledExpression.as(DeclReferenceExprSyntax.self)?.baseName.text,
              let first = node.arguments.first, first.label == nil,
              let name = Self.plainText(first.expression)
        else { return .visitChildren }
        if Self.declarationKinds.contains(callee) {
            terms.insert(name)
        } else if callee == "Prefix" {
            prefixes.insert(name)
        }
        return .visitChildren
    }

    private func enter(_ name: TokenSyntax, _ attributes: AttributeListSyntax, _ inheritance: InheritanceClauseSyntax?) -> SyntaxVisitorContinueKind {
        declare(name)
        if Self.isOntology(attributes, inheritance) {
            ontologies.insert(name.text)
            depth += 1
        }
        return .visitChildren
    }

    private func leave(_ attributes: AttributeListSyntax, _ inheritance: InheritanceClauseSyntax?) {
        if Self.isOntology(attributes, inheritance) {
            depth -= 1
        }
    }

    /// A type declared inside an ontology is one of its terms.
    private func declare(_ name: TokenSyntax) {
        if depth > 0 {
            terms.insert(name.text)
        }
    }

    private static func isOntology(_ attributes: AttributeListSyntax, _ inheritance: InheritanceClauseSyntax?) -> Bool {
        let marked = attributes.contains { element in
            guard case .attribute(let attribute) = element else { return false }
            return typeName(attribute.attributeName) == "Ontology"
        }
        let conforming = inheritance?.inheritedTypes.contains { typeName($0.type) == "Ontology" } ?? false
        return marked || conforming
    }

    /// `Ontology`, `RDFKit.Ontology`
    private static func typeName(_ type: TypeSyntax) -> String? {
        if let identifier = type.as(IdentifierTypeSyntax.self) { return identifier.name.text }
        if let member = type.as(MemberTypeSyntax.self) { return member.name.text }
        return nil
    }

    private static func typeName(of decl: DeclSyntax) -> String? {
        switch decl.as(DeclSyntaxEnum.self) {
        case .classDecl(let node): node.name.text
        case .structDecl(let node): node.name.text
        case .enumDecl(let node): node.name.text
        case .actorDecl(let node): node.name.text
        case .protocolDecl(let node): node.name.text
        default: nil
        }
    }

    /// The text of a string literal with one plain segment: `"Animal"`.
    private static func plainText(_ expression: ExprSyntax) -> String? {
        guard let literal = expression.as(StringLiteralExprSyntax.self),
              literal.segments.count == 1,
              let segment = literal.segments.first?.as(StringSegmentSyntax.self)
        else { return nil }
        return segment.content.text
    }
}
