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

message := "Refer to a term by its type, as in Domain(Fauna.Animal); not by a string, an IRI, an .iri projection, .self or explicit generic arguments."

# `Domain("Animal")`, `Range(IRI("…"))`, `Domain(Fauna.Animal.iri)`,
# `SubClassOf(Animal.self)`
denial_set contains finding(call) if {
  call := input
  call.type == "FunctionCallExprSyntax"
  call.children[0].type == "DeclReferenceExprSyntax"
  call.children[0].children[0].token.text in term_references
  some arguments in call.children
  arguments.type == "LabeledExprListSyntax"
  some argument in arguments.children
  some value in argument.children
  some form in forms(value)
  by_name(form)
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

# `"Animal"`, `"http://www.w3.org/2001/XMLSchema#" + "nonNegativeInteger"`,
# `"\(xsd)nonNegativeInteger"`: any argument built from a string.
by_name(value) if {
  walk(value, [_, node])
  node.type == "StringLiteralExprSyntax"
}

# `IRI("…")`, `try! IRI(validating: "…")`
by_name(value) if {
  value.type == "FunctionCallExprSyntax"
  callee_name(value.children[0]) == "IRI"
}

# `Fauna.Animal.iri`, `term.rawValue`: the IRI projection in place of the type.
by_name(value) if {
  value.type == "MemberAccessExprSyntax"
  name := value.children[count(value.children) - 1]
  name.type == "DeclReferenceExprSyntax"
  name.children[0].token.text in {"iri", "rawValue"}
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

# The expression, and what `try`, `try!`, `await` and `!` wrap, two levels deep.
wrappers := {"TryExprSyntax", "AwaitExprSyntax", "ForceUnwrapExprSyntax", "OptionalChainingExprSyntax"}

forms(value) := {value} | inner(value) | {deeper | some form in inner(value); some deeper in inner(form)}

inner(value) := {child |
  value.type in wrappers
  some child in value.children
  child.type != "TokenSyntax"
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
