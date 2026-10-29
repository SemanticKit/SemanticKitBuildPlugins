package semantickit.design_guidelines.no_term_reference_by_name

# A term refers to another term by its type, in the natural spelling
# `Domain(Fauna.Animal)`: never by a string, an IRI, a `.self` metatype or
# explicit generic arguments.
# DESIGN-CONTRACT.md rule 7 (Charles): "`Domain(Fauna.Animal)`,
# `Range(Fauna.Habitat)`. No explicit generic arguments, no `.self`." Rule 2:
# "Types never communicate through IRI strings."

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

message := "Refer to a term by its type, as in Domain(Fauna.Animal); not by a string, an IRI, .self or explicit generic arguments."

# `Domain("Animal")`, `Range(IRI("…"))`, `SubClassOf(Animal.self)`
denial_set contains finding(call) if {
  call := input
  call.type == "FunctionCallExprSyntax"
  call.children[0].type == "DeclReferenceExprSyntax"
  call.children[0].children[0].token.text in term_references
  some arguments in call.children
  arguments.type == "LabeledExprListSyntax"
  some argument in arguments.children
  some value in argument.children
  by_name(value)
}

# `Domain<Fauna.Animal>()`
denial_set contains finding(call) if {
  call := input
  call.type == "FunctionCallExprSyntax"
  call.children[0].type == "GenericSpecializationExprSyntax"
  callee := call.children[0].children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text in term_references
}

by_name(value) if value.type == "StringLiteralExprSyntax"

by_name(value) if {
  value.type == "FunctionCallExprSyntax"
  value.children[0].type == "DeclReferenceExprSyntax"
  value.children[0].children[0].token.text == "IRI"
}

by_name(value) if {
  value.type == "MemberAccessExprSyntax"
  name := value.children[count(value.children) - 1]
  name.type == "DeclReferenceExprSyntax"
  name.children[0].token.text == "self"
}

term_references := {
  "Domain",
  "Range",
  "SubClassOf",
  "SubPropertyOf",
  "EquivalentClass",
  "EquivalentProperty",
  "InverseOf",
  "DisjointWith",
}

finding(node) := {
  "rule_id": "semantickit.design_guidelines.no_term_reference_by_name",
  "message": message,
  "line": node.range.start.line,
  "column": node.range.start.column,
  "severity": "error",
}
