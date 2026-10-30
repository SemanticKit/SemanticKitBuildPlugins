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
# `var body`, not as a static.
# Binding identity rule (Charles): "An IRI on a type is a static projection
# computed from the namespace, read only at the boundary."
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
  decl := input
  decl.type == "VariableDeclSyntax"
  is_static(decl)
  some bindings in decl.children
  bindings.type == "PatternBindingListSyntax"
  some binding in bindings.children
  iri_binding(binding)
}

is_static(decl) if {
  some modifiers in decl.children
  modifiers.type == "DeclModifierListSyntax"
  some modifier in modifiers.children
  modifier.children[0].token.text in {"static", "class"}
}

# `static let knows: IRI`, `: URL?`, `: IRIKit.IRI!`; not the projection.
iri_binding(binding) if {
  not projection(binding)
  some annotation in binding.children
  annotation.type == "TypeAnnotationSyntax"
  some type in annotation.children
  iri_type(type)
}

iri_binding(binding) if {
  some value in values(binding)
  iri_value(value)
}

# `static var iri: IRI { … }`: the type's own IRI, computed.
projection(binding) if {
  binding.children[0].type == "IdentifierPatternSyntax"
  binding.children[0].children[0].token.text == "iri"
  some accessor in binding.children
  accessor.type == "AccessorBlockSyntax"
  not initialized(binding)
}

initialized(binding) if {
  some initializer in binding.children
  initializer.type == "InitializerClauseSyntax"
}

# What the property is set to, or what its accessors compute.
values(binding) := {value |
  some clause in binding.children
  clause.type in {"InitializerClauseSyntax", "AccessorBlockSyntax"}
  some value in clause.children
  value.type != "TokenSyntax"
}

# `URL(string: "…")!`, `try! IRI(validating: "…")`, `{ NamedNode("…") }()`
iri_value(value) if {
  walk(value, [_, call])
  call.type == "FunctionCallExprSyntax"
  callee_name(call.children[0]) in identifier_types
}

# `"http://xmlns.com/foaf/0.1/knows"`, `Namespace("http://…")`, `"foaf:knows"`
iri_value(value) if {
  walk(value, [_, literal])
  literal.type == "StringLiteralExprSyntax"
  iri_string(leading_text(literal))
}

# `"\(ns)knows"`
iri_value(value) if {
  walk(value, [_, segment])
  segment.type == "ExpressionSegmentSyntax"
}

# `ns + "knows"`, `"http://…" + name`
iri_value(value) if {
  walk(value, [_, sequence])
  sequence.type == "SequenceExprSyntax"
  some list in sequence.children
  some operator in list.children
  operator.type == "BinaryOperatorExprSyntax"
  operator.children[0].token.text == "+"
  some operand in list.children
  operand.type == "StringLiteralExprSyntax"
}

# `ns.appending("knows")`, `[ns, "knows"].joined()`, `String(format: "%@knows", ns)`
iri_value(value) if {
  walk(value, [_, call])
  string_building_call(call)
  walk(call, [_, literal])
  literal.type == "StringLiteralExprSyntax"
}

# `ns.appending("knows")`, `[ns, "knows"].joined()`, `String(format: "%@knows",
# ns)`: a string built by a call rather than by `+`. `URL.appending(path:)` and
# `appendingPathComponent(_:)` take labels or name file paths and are not
# string concatenation.
string_building_call(call) if {
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  callee.children[count(callee.children) - 1].children[0].token.text == "joined"
}

string_building_call(call) if {
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  callee.children[count(callee.children) - 1].children[0].token.text == "appending"
  some arguments in call.children
  arguments.type == "LabeledExprListSyntax"
  count(arguments.children) == 1
  arguments.children[0].children[0].type != "TokenSyntax"
}

string_building_call(call) if {
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "String"
  some arguments in call.children
  arguments.type == "LabeledExprListSyntax"
  first := arguments.children[0].children[0]
  first.type == "TokenSyntax"
  first.token.text == "format"
}

iri_type(type) if named_iri(type)

iri_type(type) if {
  type.type in {"OptionalTypeSyntax", "ImplicitlyUnwrappedOptionalTypeSyntax"}
  named_iri(type.children[0])
}

named_iri(type) if {
  type.type == "IdentifierTypeSyntax"
  type.children[0].token.text in identifier_types
}

named_iri(type) if {
  type.type == "MemberTypeSyntax"
  some name in type.children
  name.type == "TokenSyntax"
  name.token.kind == "identifier"
  name.token.text in identifier_types
}

identifier_types := {"IRI", "URL", "URI", "NamedNode", "IRIRef"}

# The text before any interpolation: "http://example.org/" in
# "http://example.org/\(name)".
leading_text(literal) := text if {
  some segments in literal.children
  segments.type == "StringLiteralSegmentListSyntax"
  segment := segments.children[0]
  segment.type == "StringSegmentSyntax"
  text := segment.children[0].token.text
}

# "http://xmlns.com/foaf/0.1/knows", "urn:isbn:…", "foaf:knows"
iri_string(text) if regex.match(`^[A-Za-z][A-Za-z0-9+.-]*:[^\s]+$`, text)

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
