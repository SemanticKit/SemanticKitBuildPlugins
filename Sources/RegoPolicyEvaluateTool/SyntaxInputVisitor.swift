import AST
import SwiftSyntax

/// Walks a source file and collects, for each kind of node ``SyntaxInput``
/// lists, every node of that kind with the declarations around it.
final class SyntaxInputVisitor: SyntaxVisitor {
    private let locations: SourceLocationConverter
    private var lists: [String: [AST.RegoValue]] = [:]
    /// The declarations around the node being visited, outermost first.
    private var context: [AST.RegoValue] = []

    /// The properties a declaration in `context` leaves out: what it
    /// contains rather than what it is.
    private static let contents: Set<String> = ["memberBlock", "body"]

    init(locations: SourceLocationConverter) {
        self.locations = locations
        super.init(viewMode: .sourceAccurate)
    }

    /// The lists, each under its name.
    var input: AST.RegoValue {
        .object(Dictionary(uniqueKeysWithValues: lists.map { (.string($0.key), .array($0.value)) }))
    }

    private func collect(_ value: AST.RegoValue, in list: String) {
        lists[list, default: []].append(context.isEmpty ? value : value.setting("context", .array(context)))
    }

    /// Collects a declaration and makes it part of the context of what it contains.
    private func enter(_ node: some DeclSyntaxProtocol & RegoInputConvertible, _ name: String) -> SyntaxVisitorContinueKind {
        let value = node.regoInput(locations)
        collect(value, in: "\(name)s")
        context.append([name: Self.header(of: node, value)])
        return .visitChildren
    }

    private func leave() {
        context.removeLast()
    }

    /// The declaration's `value` without its contents; a variable's without
    /// the values of its bindings.
    private static func header(of node: some DeclSyntaxProtocol, _ value: AST.RegoValue) -> AST.RegoValue {
        let header = value.removing(contents)
        guard node.is(VariableDeclSyntax.self), case .array(let bindings)? = header["bindings"] else { return header }
        return header.setting("bindings", .array(bindings.map { $0.removing(["initializer", "accessorBlock"]) }))
    }

    // MARK: Declarations

    override func visit(_ node: StructDeclSyntax) -> SyntaxVisitorContinueKind { enter(node, "structDecl") }
    override func visitPost(_ node: StructDeclSyntax) { leave() }

    override func visit(_ node: ClassDeclSyntax) -> SyntaxVisitorContinueKind { enter(node, "classDecl") }
    override func visitPost(_ node: ClassDeclSyntax) { leave() }

    override func visit(_ node: EnumDeclSyntax) -> SyntaxVisitorContinueKind { enter(node, "enumDecl") }
    override func visitPost(_ node: EnumDeclSyntax) { leave() }

    override func visit(_ node: ActorDeclSyntax) -> SyntaxVisitorContinueKind { enter(node, "actorDecl") }
    override func visitPost(_ node: ActorDeclSyntax) { leave() }

    override func visit(_ node: ProtocolDeclSyntax) -> SyntaxVisitorContinueKind { enter(node, "protocolDecl") }
    override func visitPost(_ node: ProtocolDeclSyntax) { leave() }

    override func visit(_ node: ExtensionDeclSyntax) -> SyntaxVisitorContinueKind { enter(node, "extensionDecl") }
    override func visitPost(_ node: ExtensionDeclSyntax) { leave() }

    override func visit(_ node: FunctionDeclSyntax) -> SyntaxVisitorContinueKind { enter(node, "functionDecl") }
    override func visitPost(_ node: FunctionDeclSyntax) { leave() }

    override func visit(_ node: InitializerDeclSyntax) -> SyntaxVisitorContinueKind { enter(node, "initializerDecl") }
    override func visitPost(_ node: InitializerDeclSyntax) { leave() }

    override func visit(_ node: VariableDeclSyntax) -> SyntaxVisitorContinueKind { enter(node, "variableDecl") }
    override func visitPost(_ node: VariableDeclSyntax) { leave() }

    override func visit(_ node: EnumCaseDeclSyntax) -> SyntaxVisitorContinueKind {
        collect(node.regoInput(locations), in: "enumCaseDecls")
        return .visitChildren
    }

    // MARK: Expressions and statements

    override func visit(_ node: FunctionCallExprSyntax) -> SyntaxVisitorContinueKind {
        collect(node.regoInput(locations), in: "functionCallExprs")
        return .visitChildren
    }

    override func visit(_ node: MemberAccessExprSyntax) -> SyntaxVisitorContinueKind {
        collect(node.regoInput(locations), in: "memberAccessExprs")
        return .visitChildren
    }

    override func visit(_ node: DeclReferenceExprSyntax) -> SyntaxVisitorContinueKind {
        collect(node.regoInput(locations), in: "declReferenceExprs")
        return .visitChildren
    }

    override func visit(_ node: StringLiteralExprSyntax) -> SyntaxVisitorContinueKind {
        collect(node.regoInput(locations), in: "stringLiteralExprs")
        return .visitChildren
    }

    override func visit(_ node: InfixOperatorExprSyntax) -> SyntaxVisitorContinueKind {
        collect(node.regoInput(locations), in: "infixOperatorExprs")
        return .visitChildren
    }

    override func visit(_ node: DictionaryExprSyntax) -> SyntaxVisitorContinueKind {
        collect(node.regoInput(locations), in: "dictionaryExprs")
        return .visitChildren
    }

    override func visit(_ node: GenericSpecializationExprSyntax) -> SyntaxVisitorContinueKind {
        collect(node.regoInput(locations), in: "genericSpecializationExprs")
        return .visitChildren
    }

    override func visit(_ node: MacroExpansionExprSyntax) -> SyntaxVisitorContinueKind {
        collect(node.regoInput(locations), in: "macroExpansionExprs")
        return .visitChildren
    }

    override func visit(_ node: ReturnStmtSyntax) -> SyntaxVisitorContinueKind {
        collect(node.regoInput(locations), in: "returnStmts")
        return .visitChildren
    }

    // MARK: Types

    override func visit(_ node: IdentifierTypeSyntax) -> SyntaxVisitorContinueKind {
        collect(node.regoInput(locations), in: "identifierTypes")
        return .visitChildren
    }

    override func visit(_ node: MemberTypeSyntax) -> SyntaxVisitorContinueKind {
        collect(node.regoInput(locations), in: "memberTypes")
        return .visitChildren
    }

    override func visit(_ node: DictionaryTypeSyntax) -> SyntaxVisitorContinueKind {
        collect(node.regoInput(locations), in: "dictionaryTypes")
        return .visitChildren
    }
}
