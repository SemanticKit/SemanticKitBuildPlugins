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
  some call in input.functionCallExprs
  call.calledExpression.memberAccessExpr.declName.baseName == "values"
  some argument in call.arguments
  argument.label == "of"
}

# `values(of: alice)`: a bare call, on `self` or a free function
denial_set contains finding(call) if {
  some call in input.functionCallExprs
  call.calledExpression.declReferenceExpr.baseName == "values"
  some argument in call.arguments
  argument.label == "of"
}

# `func values(of subject: …)`
denial_set contains finding(decl) if {
  some decl in input.functionDecls
  decl.name == "values"
  some parameter in decl.signature.parameterClause.parameters
  parameter.firstName == "of"
}

finding(node) := {
  "rule_id": "semantickit.design_guidelines.no_values_of_lookup",
  "message": message,
  "line": node.range.start.line,
  "column": node.range.start.column,
  "severity": "error",
}
