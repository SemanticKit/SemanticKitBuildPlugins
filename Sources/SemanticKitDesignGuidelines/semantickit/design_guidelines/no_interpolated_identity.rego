package semantickit.design_guidelines.no_interpolated_identity

# An IRI built by string interpolation or concatenation is identity built
# from strings at run time (`IRI(rawValue: "\(namespace)\(name)")`), however
# the initializer is spelled: `IRI(...)`, `IRI.init(...)`, `IRIKit.IRI(...)`,
# `IRIKit.IRI.init(...)`.
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
  callee_name(call.children[0]) == "IRI"
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

# `IRI`, `IRIKit.IRI`, `IRI.init`, `IRIKit.IRI.init`
callee_name(callee) := reference_name(callee) if not initializer_reference(callee)

callee_name(callee) := reference_name(callee.children[0]) if initializer_reference(callee)

initializer_reference(callee) if {
  callee.type == "MemberAccessExprSyntax"
  callee.children[count(callee.children) - 1].children[0].token.text == "init"
}

reference_name(reference) := reference.children[0].token.text if reference.type == "DeclReferenceExprSyntax"

reference_name(reference) := reference.children[count(reference.children) - 1].children[0].token.text if {
  reference.type == "MemberAccessExprSyntax"
}
