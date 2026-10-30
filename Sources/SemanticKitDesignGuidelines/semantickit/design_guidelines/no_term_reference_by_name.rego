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
# `SubClassOf(Animal.self)`, `Domain((Animal.self))`
denial_set contains finding(call) if {
  some call in input.functionCallExprs
  term_reference_call(call)
  some argument in call.arguments
  some form in forms(argument.expression)
  by_name(form)
}

# `Domain<Fauna.Animal>()`, `SubClassOf<Fauna.Animal>.init()`
denial_set contains finding(call) if {
  some call in input.functionCallExprs
  some specialization in specializations(call.calledExpression)
  name := specialization.expression.declReferenceExpr.baseName
  name in term_references
  dsl_generic(name, call)
}

# `IRIAssertion<DomainDeclaration>(Animal.self)`, `TextAssertion<…>.init(…)`:
# the generic assertion the DSL's term references are typealiases of,
# spelled with its generic argument.
denial_set contains finding(call) if {
  some call in input.functionCallExprs
  some specialization in specializations(call.calledExpression)
  regex.match(`^[A-Z][A-Za-z]*Assertion$`, specialization.expression.declReferenceExpr.baseName)
}

# A call of a term reference, spelled `Domain(…)` or `Domain.init(…)`.
term_reference_call(call) if {
  some callee in callees(call.calledExpression)
  name := callee.declReferenceExpr.baseName
  name in term_references
  dsl_arguments(name, call)
}

# The callee, and the type a `.init` is called on.
callees(callee) := {callee} | {base |
  callee.memberAccessExpr.declName.baseName == "init"
  base := callee.memberAccessExpr.base
}

specializations(callee) := {specialization | some form in callees(callee); specialization := form.genericSpecializationExpr}

# `Range` is also Swift's own `Range`: `Range<Int>(uncheckedBounds: (0, 4))`,
# `Range(nsRange, in: text)`. The DSL's `Range(Fauna.Habitat)` takes one
# unlabelled argument, and spelled with a generic argument it takes none.
dsl_arguments(name, _) if name != "Range"

dsl_arguments("Range", call) if {
  [argument] := call.arguments
  not argument.label
}

dsl_generic(name, _) if name != "Range"

dsl_generic("Range", call) if count(object.get(call, "arguments", [])) == 0

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

# `Animal.self`, `(Animal.self)`, `Animal.self as Any.Type`: a metatype
# anywhere in the argument.
by_name(value) if {
  walk(value, [_, node])
  node.memberAccessExpr.declName.baseName == "self"
}

# The DSL's term references: RDFKit's `IRIAssertion` typealiases (`Type`,
# `Domain`, `Range`, `SeeAlso`, `SubClassOf`, `SubPropertyOf`,
# `IsDefinedBy`) and the OWL axioms that refer to a term.
term_references := {
  "Type",
  "Domain",
  "Range",
  "SeeAlso",
  "IsDefinedBy",
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
