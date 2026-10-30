package semantickit.design_guidelines.no_hand_typed_iri_member

# A type's instance property whose value is a hand-typed absolute IRI or
# prefixed name: `struct Person { let iri = IRI("http://xmlns.com/foaf/0.1/Person") }`,
# `var iri: IRI { IRI("http://…") }`, `var id: IRI { IRI("http://…") }` on an
# `Identifiable` class, `let type = "foaf:Person"`. The IRI is copied by hand
# out of the vocabulary's own document, and it ties the type to a string
# instead of deriving the IRI from the declaration's ontology and namespace.
# Static and file-scope IRIs are `no_static_iri_constant`'s; IRIs built from
# strings are `no_interpolated_identity`'s. Not reported: a format's coder
# (`TurtleDecoder`, a type conforming to `Encoder` or `Decoder`), which reads
# and writes IRIs, and an ontology's own `var body`, whose
# `Namespace("https://…")` is the declaration every IRI is derived from.
# DESIGN-CONTRACT.md rule 0 (Charles): "Any code that hand-types what the
# spec's own documents define is drift and gets deleted: vocabulary terms,
# individuals, IRIs". Rule 2: "Types never communicate through IRI strings."
# Rule 17: an IRI "is something that is inferred from its ontology
# declaration, and created when it is asked for."

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

finding(node) := {
  "rule_id": "semantickit.design_guidelines.no_hand_typed_iri_member",
  "message": "Do not hand-type an IRI on a type's property; the type is the identity, and its IRI is derived from its ontology declaration when a coder asks for it.",
  "line": node.range.start.line,
  "column": node.range.start.column,
  "severity": "error",
}

denial_set contains finding(binding) if {
  some decl in input.variableDecls
  not is_static(decl)
  owner := owner_of(decl)
  not coder(owner)
  not ontology(owner)
  some binding in decl.bindings
  some value in values(binding)
  walk(value, [_, node])
  iri_string(leading_text(node.stringLiteralExpr))
}

is_static(decl) if {
  some modifier in decl.modifiers
  modifier.name in {"static", "class"}
}

# A property declared directly in a type or an extension, not a local
# variable of a function or an accessor.
owner_of(decl) := owner if {
  context := decl.context
  last := context[count(context) - 1]
  some kind in {"structDecl", "classDecl", "enumDecl", "actorDecl", "extensionDecl", "protocolDecl"}
  owner := last[kind]
}

values(binding) := {value | value := binding.initializer.value} | {block | block := binding.accessorBlock}

# `TurtleDecoder`, `NTriplesEncoder`, `extension TurtleDecoder`, a type
# conforming to `Encoder`, `Decoder`, `TopLevelEncoder` or `TopLevelDecoder`.
coder(owner) if regex.match(`(Encoder|Decoder)$`, owner.name)

coder(owner) if regex.match(`(Encoder|Decoder)$`, type_name(owner.extendedType))

coder(owner) if {
  some inherited in owner.inheritanceClause.inheritedTypes
  type_name(inherited.type) in {"Encoder", "Decoder", "TopLevelEncoder", "TopLevelDecoder"}
}

# `@Ontology struct Fauna`, `struct Fauna: Ontology`
ontology(owner) if {
  some attribute in owner.attributes
  type_name(attribute.attributeName) == "Ontology"
}

ontology(owner) if {
  some inherited in owner.inheritanceClause.inheritedTypes
  type_name(inherited.type) == "Ontology"
}

type_name(type) := type.identifierType.name

type_name(type) := type.memberType.name

# The text before any interpolation.
leading_text(literal) := segment.stringSegment.content if {
  some segment in literal.segments
  every other in literal.segments {
    not starts_before(other, segment)
  }
}

starts_before(a, b) if object.get(a, "stringSegment", object.get(a, "expressionSegment", {})).range.start.line < object.get(b, "stringSegment", object.get(b, "expressionSegment", {})).range.start.line

starts_before(a, b) if {
  start_a := object.get(a, "stringSegment", object.get(a, "expressionSegment", {})).range.start
  start_b := object.get(b, "stringSegment", object.get(b, "expressionSegment", {})).range.start
  start_a.line == start_b.line
  start_a.column < start_b.column
}

# "http://xmlns.com/foaf/0.1/Person", "urn:isbn:…", "foaf:Person"
iri_string(text) if regex.match(`^[A-Za-z][A-Za-z0-9+.-]*:[^\s]+$`, text)
