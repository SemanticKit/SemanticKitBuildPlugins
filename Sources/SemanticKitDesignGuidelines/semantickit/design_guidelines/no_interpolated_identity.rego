package semantickit.design_guidelines.no_interpolated_identity

# An IRI built by string interpolation or concatenation is identity built
# from strings at run time (`IRI(rawValue: "\(namespace)\(name)")`).
# DESIGN-CONTRACT.md rule 2 (Charles): "Types never communicate through IRI
# strings." An IRI on a type is a projection computed from its namespace,
# read only at the boundary.

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

denial_set contains {
  "rule_id": "semantickit.design_guidelines.no_interpolated_identity",
  "message": "Do not build an IRI from interpolated or concatenated strings; identity is the type, and its IRI is computed from its namespace at the boundary.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "error",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  call.children[0].type == "DeclReferenceExprSyntax"
  call.children[0].children[0].token.text == "IRI"
  some arguments in call.children
  arguments.type == "LabeledExprListSyntax"
  built_from_strings(arguments)
}

built_from_strings(arguments) if {
  walk(arguments, [_, node])
  node.type == "ExpressionSegmentSyntax"
}

built_from_strings(arguments) if {
  walk(arguments, [_, node])
  node.type == "BinaryOperatorExprSyntax"
  node.children[0].token.text == "+"
}
