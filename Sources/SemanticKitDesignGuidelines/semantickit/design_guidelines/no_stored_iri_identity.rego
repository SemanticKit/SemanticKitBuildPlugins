package semantickit.design_guidelines.no_stored_iri_identity

# A class, struct or individual that holds its IRI as its identity. In Swift
# the instance is the identity; the IRI is materialised from the
# declaration's ontology and namespace when a coder, translator or comparison
# asks for it. Denied, on any struct, class, actor, enum, protocol or
# extension:
# - an instance property named `iri` or `id` typed as an identifier (`IRI`,
#   `URL`, `URI`, `NamedNode`, `IRIRef`, also optional or module-qualified)
#   or set to one's initializer or factory, stored or computed, and a
#   protocol's requirement of one: `let iri: IRI`, `var iri: IRIKit.IRI?`,
#   `var id: IRI` on an `Identifiable` class, `protocol Resource { var iri:
#   IRI { get } }`;
# - an initializer that takes the IRI: `init(iri: IRI)`, `init(_ iri: IRI)`;
# - an individual made from an IRI: `let tweety = Bird(iri: …)`,
#   `Person.init(iri: …)`.
# Not reported: a format's coder (`TurtleDecoder`, a type conforming to
# `Encoder` or `Decoder`, an extension of one), a type's own `Codable`
# conformance (`init(from:)`, `encode(to:)`) and the identifier types
# themselves, which read and write IRIs at the boundary, as for the other
# identity rules (`no_interpolated_identity`'s boundary coders). A
# property whose value is a hand-typed IRI string is
# `no_hand_typed_iri_member`'s, and a static IRI is
# `no_static_iri_constant`'s.
# DESIGN-CONTRACT.md rule 17 (Charles): "In RDF, IRI is identity. In Swift,
# the instance is identity. They are mutual. They are different." "So: no
# stored or static IRI and no `iri:` initializer on generated classes,
# properties or individuals."

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

finding(node) := {
  "rule_id": "semantickit.design_guidelines.no_stored_iri_identity",
  "message": "Do not hold an IRI as the identity of a class, struct or individual, or take one in init(iri:); the instance is the identity, and its IRI is derived from its declaration when a coder asks for it.",
  "line": node.range.start.line,
  "column": node.range.start.column,
  "severity": "error",
}

# `let iri: IRI`, `var id: IRI { … }`, `var iri: IRI { get }`
denial_set contains finding(binding) if {
  some decl in input.variableDecls
  not is_static(decl)
  member(decl)
  not in_boundary(decl)
  some binding in decl.bindings
  binding.pattern.identifierPattern.identifier in identity_names
  iri_binding(binding)
  not hand_typed(binding)
}

# `init(iri: IRI)`, `init(_ iri: IRI)`
denial_set contains finding(initializer) if {
  some initializer in input.initializerDecls
  not in_boundary(initializer)
  some parameter in initializer.signature.parameterClause.parameters
  iri_parameter(parameter)
}

# `Bird(iri: …)`, `Person.init(iri: …)`, `RDFKit.Individual(iri: …)`
denial_set contains finding(call) if {
  some call in input.functionCallExprs
  not in_boundary(call)
  type := callee_type(call)
  regex.match(`^[A-Z]`, type)
  not type in identifier_types
  some argument in call.arguments
  argument.label == "iri"
}

identity_names := {"iri", "id"}

is_static(decl) if {
  some modifier in decl.modifiers
  modifier.name in {"static", "class"}
}

# A property declared directly in a type or an extension, not a local
# variable of a function or an accessor.
member(decl) if {
  context := decl.context
  last := context[count(context) - 1]
  some kind in {"structDecl", "classDecl", "enumDecl", "actorDecl", "extensionDecl", "protocolDecl"}
  last[kind]
}

iri_binding(binding) if iri_type(binding.typeAnnotation.type)

iri_binding(binding) if {
  some value in values(binding)
  walk(value, [_, node])
  callee_type(node.functionCallExpr) in identifier_types
}

iri_binding(binding) if {
  some value in values(binding)
  walk(value, [_, node])
  access := node.memberAccessExpr
  access.declName.baseName != "init"
  reference_name(access.base) in identifier_types
}

values(binding) := {value | value := binding.initializer.value} | {block | block := binding.accessorBlock}

# A hand-typed IRI string in the value: `no_hand_typed_iri_member`'s.
hand_typed(binding) if {
  some value in values(binding)
  walk(value, [_, node])
  some segment in node.stringLiteralExpr.segments
  regex.match(`^[A-Za-z][A-Za-z0-9+.-]*:[^\s]+$`, segment.stringSegment.content)
}

# `iri: IRI`, `iri: String`, `_ iri: IRI`
iri_parameter(parameter) if parameter.firstName == "iri"

iri_parameter(parameter) if {
  parameter.secondName == "iri"
  iri_type(parameter.type)
}

# A declaration around the node is a coder, a `Codable` conformance's
# `init(from:)` or `encode(to:)`, or an identifier type.
in_boundary(node) if {
  some declaration in node.context
  boundary(declaration)
}

# `TurtleDecoder`, `NTriplesEncoder`, `extension TurtleDecoder`, a type
# conforming to `Encoder`, `Decoder`, `TopLevelEncoder` or `TopLevelDecoder`.
boundary(declaration) if regex.match(`(Encoder|Decoder)$`, type_declaration(declaration).name)

boundary(declaration) if regex.match(`(Encoder|Decoder)$`, type_name(declaration.extensionDecl.extendedType))

boundary(declaration) if {
  some inherited in type_declaration(declaration).inheritanceClause.inheritedTypes
  type_name(inherited.type) in coder_protocols
}

boundary(declaration) if {
  some inherited in declaration.extensionDecl.inheritanceClause.inheritedTypes
  type_name(inherited.type) in coder_protocols
}

# `func encode(to encoder: Encoder)`, `any Encoder`, `some Encoder`
boundary(declaration) if {
  function := declaration.functionDecl
  function.name == "encode"
  [parameter] := function.signature.parameterClause.parameters
  parameter.firstName == "to"
  coder_parameter(parameter.type) == "Encoder"
}

# `init(from decoder: Decoder)`, `any Decoder`, `some Decoder`
boundary(declaration) if {
  [parameter] := declaration.initializerDecl.signature.parameterClause.parameters
  parameter.firstName == "from"
  coder_parameter(parameter.type) == "Decoder"
}

# `struct IRI`, `extension IRIKit.IRI`: the identifier types themselves.
boundary(declaration) if type_declaration(declaration).name in identifier_types

boundary(declaration) if type_name(declaration.extensionDecl.extendedType) in identifier_types

coder_parameter(type) := type_name(type)

coder_parameter(type) := type_name(type.someOrAnyType.constraint)

coder_protocols := {"Encoder", "Decoder", "TopLevelEncoder", "TopLevelDecoder"}

type_declaration(declaration) := declaration.structDecl

type_declaration(declaration) := declaration.classDecl

type_declaration(declaration) := declaration.enumDecl

type_declaration(declaration) := declaration.actorDecl

iri_type(type) if named_iri(type)

iri_type(type) if named_iri(type.optionalType.wrappedType)

iri_type(type) if named_iri(type.implicitlyUnwrappedOptionalType.wrappedType)

named_iri(type) if type_name(type) in identifier_types

identifier_types := {"IRI", "URL", "URI", "NamedNode", "IRIRef"}

type_name(type) := type.identifierType.name

type_name(type) := type.memberType.name

# The type a call makes: `Bird` in `Bird(…)`, `Bird.init(…)`,
# `Fauna.Bird(…)` and `Fauna.Bird.init(…)`.
callee_type(call) := call.calledExpression.declReferenceExpr.baseName

callee_type(call) := name if {
  name := call.calledExpression.memberAccessExpr.declName.baseName
  name != "init"
}

callee_type(call) := reference_name(access.base) if {
  access := call.calledExpression.memberAccessExpr
  access.declName.baseName == "init"
}

reference_name(expression) := expression.declReferenceExpr.baseName

reference_name(expression) := expression.memberAccessExpr.declName.baseName
