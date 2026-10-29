package semantickit.design_guidelines.no_values_of_lookup

# `values(of:)` reads a property by asking the property for a subject's
# values, instead of reading the property on the individual's type.
# DESIGN-CONTRACT.md rule 1 (Charles): "Build on our own stack." Wrong:
# `Cert.key.values(of: alice)`, `Solid.oidcIssuer.values(of:)`.

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

message := "Do not read properties through values(of:); a property is read on the individual's type."

# `Cert.key.values(of: alice)`
denial_set contains finding(call) if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  name := callee.children[count(callee.children) - 1]
  name.type == "DeclReferenceExprSyntax"
  name.children[0].token.text == "values"
  some arguments in call.children
  arguments.type == "LabeledExprListSyntax"
  arguments.children[0].children[0].token.text == "of"
}

# `func values(of subject: …)`
denial_set contains finding(decl) if {
  decl := input
  decl.type == "FunctionDeclSyntax"
  some name in decl.children
  name.token.kind == "identifier"
  name.token.text == "values"
  some signature in decl.children
  signature.type == "FunctionSignatureSyntax"
  some clause in signature.children
  clause.type == "FunctionParameterClauseSyntax"
  some list in clause.children
  list.type == "FunctionParameterListSyntax"
  some label in list.children[0].children
  label.type == "TokenSyntax"
  label.token.text == "of"
}

finding(node) := {
  "rule_id": "semantickit.design_guidelines.no_values_of_lookup",
  "message": message,
  "line": node.range.start.line,
  "column": node.range.start.column,
  "severity": "error",
}
