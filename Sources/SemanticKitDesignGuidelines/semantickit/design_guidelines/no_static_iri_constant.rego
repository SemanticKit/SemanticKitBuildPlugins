package semantickit.design_guidelines.no_static_iri_constant

# A static property whose value is an IRI is a term held as an IRI constant
# (`ACL.readClass`), however the IRI is built. Denied, on a static or class
# property, stored or computed:
# - typed as an identifier: `IRI`, `URL`, `URI`, `NamedNode`, `IRIRef`, also
#   optional or module-qualified (`IRIKit.IRI?`);
# - a value that calls an identifier's initializer anywhere in it:
#   `URL(string: "…")!`, `try! IRI(validating: "…")`, `NamedNode("…")`,
#   `IRIKit.IRI.init(…)`;
# - a value that holds an absolute IRI or a prefixed name as a string, passed
#   to any initializer or held bare: `"http://…"`, `Namespace("http://…")`,
#   `Prefix("owl", "http://…")`, `"foaf:knows"`;
# - a value that builds a string by interpolation, by `+` with a string, or
#   by a call that builds one from a string: `"\(ns)knows"`, `ns + "knows"`,
#   `ns.appending("knows")`, `[ns, "knows"].joined()`,
#   `String(format: "%@knows", ns)`.
# The one static IRI a type keeps is its own projection,
# `static var iri: IRI { Fauna.namespace.iri }`: computed, typed IRI, and built
# from no string. The namespace itself is declared in the ontology's
# `var body`, not as a static. Whether a declaration keeps that projection at
# all waits on Charles's confirmation of DESIGN-CONTRACT.md rule 17.
# DESIGN-CONTRACT.md rule 2 (Charles): "Types never communicate through IRI
# strings. IRIs exist only at the boundary." Rule 3: "No static mapping onto
# enums, structs and statics."

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

denial_set contains {
  "rule_id": "semantickit.design_guidelines.no_static_iri_constant",
  "message": "Do not hold a term as a static IRI, URL or IRI string, however it is built; the term's type is its identity, and its IRI is read only at the boundary.",
  "line": decl.range.start.line,
  "column": decl.range.start.column,
  "severity": "error",
} if {
  some decl in input.variableDecls
  is_static(decl)
  some binding in decl.bindings
  iri_binding(binding)
}

is_static(decl) if {
  some modifier in decl.modifiers
  modifier.name in {"static", "class"}
}

# `static let knows: IRI`, `: URL?`, `: IRIKit.IRI!`; not the projection.
iri_binding(binding) if {
  not projection(binding)
  iri_type(binding.typeAnnotation.type)
}

iri_binding(binding) if {
  some value in values(binding)
  iri_value(value)
}

# `static var iri: IRI { … }`: the type's own IRI, computed.
projection(binding) if {
  binding.pattern.identifierPattern.identifier == "iri"
  binding.accessorBlock
  not binding.initializer
}

# What the property is set to, or what its accessors compute.
values(binding) := {value | value := binding.initializer.value} | {block | block := binding.accessorBlock}

# `URL(string: "…")!`, `try! IRI(validating: "…")`, `{ NamedNode("…") }()`
iri_value(value) if {
  walk(value, [_, node])
  callee_name(node.functionCallExpr) in identifier_types
}

# `"http://xmlns.com/foaf/0.1/knows"`, `Namespace("http://…")`, `"foaf:knows"`
iri_value(value) if {
  walk(value, [_, node])
  iri_string(leading_text(node.stringLiteralExpr))
}

# `"\(ns)knows"`
iri_value(value) if {
  walk(value, [_, node])
  node.expressionSegment
}

# `ns + "knows"`, `"http://…" + name`
iri_value(value) if {
  walk(value, [_, node])
  operation := node.infixOperatorExpr
  operation.operator.binaryOperatorExpr.operator == "+"
  some operand in [operation.leftOperand, operation.rightOperand]
  operand.stringLiteralExpr
}

# `ns.appending("knows")`, `[ns, "knows"].joined()`, `String(format: "%@knows", ns)`
iri_value(value) if {
  walk(value, [_, node])
  call := node.functionCallExpr
  string_building_call(call)
  walk(call, [_, literal])
  literal.stringLiteralExpr
}

# `ns.appending("knows")`, `[ns, "knows"].joined()`, `String(format: "%@knows",
# ns)`: a string built by a call rather than by `+`. `URL.appending(path:)` and
# `appendingPathComponent(_:)` take labels or name file paths and are not
# string concatenation.
string_building_call(call) if call.calledExpression.memberAccessExpr.declName.baseName == "joined"

string_building_call(call) if {
  call.calledExpression.memberAccessExpr.declName.baseName == "appending"
  [argument] := call.arguments
  not argument.label
}

string_building_call(call) if {
  call.calledExpression.declReferenceExpr.baseName == "String"
  call.arguments[0].label == "format"
}

iri_type(type) if named_iri(type)

iri_type(type) if named_iri(type.optionalType.wrappedType)

iri_type(type) if named_iri(type.implicitlyUnwrappedOptionalType.wrappedType)

named_iri(type) if type.identifierType.name in identifier_types

named_iri(type) if type.memberType.name in identifier_types

identifier_types := {"IRI", "URL", "URI", "NamedNode", "IRIRef"}

# The text before any interpolation: "http://example.org/" in
# "http://example.org/\(name)".
leading_text(literal) := literal.segments[0].stringSegment.content

# "http://xmlns.com/foaf/0.1/knows", "urn:isbn:…", "foaf:knows"
iri_string(text) if regex.match(`^[A-Za-z][A-Za-z0-9+.-]*:[^\s]+$`, text)

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
