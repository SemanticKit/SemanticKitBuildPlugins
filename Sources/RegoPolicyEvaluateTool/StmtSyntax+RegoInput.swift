import AST
import SwiftSyntax

/// `{"item"}`: `{"decl": ...}`, `{"stmt": ...}` or `{"expr": ...}`, the case
/// of `CodeBlockItemSyntax.Item` it is.
extension CodeBlockItemSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        let value: AST.RegoValue = switch item {
        case .decl(let decl): ["decl": decl.regoInput(locations)]
        case .stmt(let stmt): ["stmt": stmt.regoInput(locations)]
        case .expr(let expr): ["expr": expr.regoInput(locations)]
        }
        return regoObject(locations, ["item": value])
    }
}

/// A statement is `{"<case>": {...}}`, the case of `StmtSyntaxEnum` it is:
/// `{"returnStmt": {"expression": ...}}`.
extension StmtSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        let (name, value): (String, AST.RegoValue) = switch self.as(StmtSyntaxEnum.self) {
        case .breakStmt(let node): ("breakStmt", node.regoObject(locations, [:]))
        case .continueStmt(let node): ("continueStmt", node.regoObject(locations, [:]))
        case .deferStmt(let node): ("deferStmt", node.regoObject(locations, ["body": node.body.regoInput(locations)]))
        case .discardStmt(let node): ("discardStmt", node.regoObject(locations, ["expression": node.expression.regoInput(locations)]))
        case .doStmt(let node): ("doStmt", node.regoObject(locations, ["body": node.body.regoInput(locations)]))
        case .expressionStmt(let node): ("expressionStmt", node.regoObject(locations, ["expression": node.expression.regoInput(locations)]))
        case .fallThroughStmt(let node): ("fallThroughStmt", node.regoObject(locations, [:]))
        case .forStmt(let node): ("forStmt", node.regoObject(locations, [
            "pattern": node.pattern.regoInput(locations),
            "sequence": node.sequence.regoInput(locations),
            "body": node.body.regoInput(locations),
        ]))
        case .guardStmt(let node): ("guardStmt", node.regoObject(locations, [
            "conditions": node.conditions.regoInput(locations),
            "body": node.body.regoInput(locations),
        ]))
        case .labeledStmt(let node): ("labeledStmt", node.regoObject(locations, [
            "label": node.label.regoText,
            "statement": node.statement.regoInput(locations),
        ]))
        case .missingStmt(let node): ("missingStmt", node.regoObject(locations, [:]))
        case .repeatStmt(let node): ("repeatStmt", node.regoObject(locations, [
            "body": node.body.regoInput(locations),
            "condition": node.condition.regoInput(locations),
        ]))
        case .returnStmt(let node): ("returnStmt", node.regoInput(locations))
        case .throwStmt(let node): ("throwStmt", node.regoObject(locations, ["expression": node.expression.regoInput(locations)]))
        case .whileStmt(let node): ("whileStmt", node.regoObject(locations, [
            "conditions": node.conditions.regoInput(locations),
            "body": node.body.regoInput(locations),
        ]))
        case .yieldStmt(let node): ("yieldStmt", node.regoObject(locations, [:]))
        // `then` statements, an experimental feature the parser is not given.
        default: ("thenStmt", regoObject(locations, [:]))
        }
        return [name: value]
    }
}

/// `{"expression"}`; no expression for a bare `return`.
extension ReturnStmtSyntax: RegoInputConvertible {
    func regoInput(_ locations: SourceLocationConverter) -> AST.RegoValue {
        regoObject(locations, ["expression": expression?.regoInput(locations)])
    }
}
