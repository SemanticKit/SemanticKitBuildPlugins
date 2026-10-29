package semantickit.design_guidelines.no_add_modifier_on_declaration

# `Class("Foo").addLabel(…).addComment(…).isDeclaredBy(namespace:)` modifies a
# type declared in an ontology. Label and Comment are declarations in the
# content of the declaration they describe.
# DESIGN-CONTRACT.md rule 6 (Charles, PR #3 review): "`add*` indicates type
# modification, and is the lazy pattern here." "`isDeclaredBy` looks like an
# expression shortcut."

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

denial_set contains {
  "rule_id": "semantickit.design_guidelines.no_add_modifier_on_declaration",
  "message": "Do not chain add* or isDeclaredBy modifiers onto a declaration; declare Label, Comment and the rest in the declaration's content.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "error",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  name := callee.children[count(callee.children) - 1]
  name.type == "DeclReferenceExprSyntax"
  type_modifier(name.children[0].token.text)
  declaration_chain(callee.children[0])
}

type_modifier(name) if regex.match(`^add[A-Z]`, name)

type_modifier("isDeclaredBy")

# The chain starts with a declaration such as `Class("Foo")`: a call of a
# capitalized name at the very start of the chain.
declaration_chain(base) if {
  walk(base, [_, node])
  node.type == "FunctionCallExprSyntax"
  node.range.start == base.range.start
  node.children[0].type == "DeclReferenceExprSyntax"
  regex.match(`^[A-Z]`, node.children[0].children[0].token.text)
}
