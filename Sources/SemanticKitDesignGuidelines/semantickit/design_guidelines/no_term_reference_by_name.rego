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
  some call in input.functionCallExprs
  call.calledExpression.declReferenceExpr.baseName in term_references
  some argument in call.arguments
  some form in forms(argument.expression)
  by_name(form)
}

# `Domain<Fauna.Animal>()`
denial_set contains finding(call) if {
  some call in input.functionCallExprs
  call.calledExpression.genericSpecializationExpr.expression.declReferenceExpr.baseName in term_references
}

# `"Animal"`, `"http://www.w3.org/2001/XMLSchema#" + "nonNegativeInteger"`,
# `"\(xsd)nonNegativeInteger"`: any argument built from a string.
by_name(value) if {
  walk(value, [_, node])
  node.stringLiteralExpr
}

# `IRI("…")`, `try! IRI(validating: "…")`
by_name(value) if callee_name(value.functionCallExpr) == "IRI"

# `Fauna.Animal.iri`, `term.rawValue`: the IRI projection in place of the type.
by_name(value) if value.memberAccessExpr.declName.baseName in {"iri", "rawValue"}

by_name(value) if value.memberAccessExpr.declName.baseName == "self"

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

# The expression, and what `try`, `try!`, `await`, `!` and `?` wrap, two
# levels deep.
forms(value) := {value} | inner(value) | {deeper | some form in inner(value); some deeper in inner(form)}

inner(value) := (({child | child := value.tryExpr.expression} | {child | child := value.awaitExpr.expression}) | {child | child := value.forceUnwrapExpr.expression}) | {child | child := value.optionalChainingExpr.expression}

# `IRI`, `IRIKit.IRI`, `IRI.init`, `IRIKit.IRI.init`
callee_name(call) := call.calledExpression.declReferenceExpr.baseName

callee_name(call) := name if {
  name := call.calledExpression.memberAccessExpr.declName.baseName
  name != "init"
}

callee_name(call) := reference_name(access.base) if {
  access := call.calledExpression.memberAccessExpr
  access.declName.baseName == "init"
}

reference_name(expression) := expression.declReferenceExpr.baseName

reference_name(expression) := expression.memberAccessExpr.declName.baseName
