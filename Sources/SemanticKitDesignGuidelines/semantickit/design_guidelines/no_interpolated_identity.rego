package semantickit.design_guidelines.no_interpolated_identity

# An IRI built by string interpolation or concatenation is identity built
# from strings at run time. Denied anywhere in a source file except inside a
# boundary encoder or decoder (see `boundary_coder`), where the format turns
# text into types and types into text:
# - an identifier's initializer given an interpolated or concatenated string,
#   however it is spelled: `IRI(rawValue: "\(namespace)\(name)")`,
#   `IRI.init(string: namespace + name)`, `URL(string: "\(base)knows")`,
#   `NamedNode(…)`, `Namespace(…)`, `IRIKit.IRI.init(…)`;
# - an IRI string built and passed to any call, bound to a name or returned:
#   `Term("http://example.org/" + name)`, `let v = "\(namespace)knows"`,
#   `return ns + name` (a term reference such as `Range(…)` given one is
#   `no_term_reference_by_name`'s). A built IRI string starts with an absolute IRI or a
#   prefixed name ("http://…\(name)", "http://…" + name), or interpolates or
#   adds a namespace (`ns`, `namespace`, `iri`, `uri`, `url`, `vocab`, or a
#   name ending in `Namespace`, `NS`, `IRI`, `URI` or `URL`).
# A built string bound to a static (`static let knows = "\(ns)knows"`) is
# `no_static_iri_constant`'s, and is not reported here too. An identifier's
# initializer built from strings is reported wherever it is, in a static too.
# The policy reads the whole file (`SourceFileSyntax`) so that it can tell
# whether a node sits inside a boundary coder.
# DESIGN-CONTRACT.md rule 2 (Charles): "Types never communicate through IRI
# strings. IRIs exist only at the boundary: serialization and translation".
# Binding identity rule: "identity built by string interpolation [is a]
# design error." An IRI on a type is a projection computed from its
# namespace, read only at the boundary.

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

message := "Do not build an IRI from interpolated or concatenated strings; identity is the type, and its IRI is computed from its namespace at the boundary."

denial_set contains {
  "rule_id": "semantickit.design_guidelines.no_interpolated_identity",
  "message": message,
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "error",
} if {
  file := input
  file.type == "SourceFileSyntax"
  walk(file, [path, call])
  call.type == "FunctionCallExprSyntax"
  callee_name(call.children[0]) in identifier_types
  some arguments in call.children
  arguments.type == "LabeledExprListSyntax"
  built_from_strings(arguments)
  not in_boundary_coder(file, path)
}

# `Term("http://example.org/" + name)`, `print("\(ns)knows")`: a built IRI
# string given to a call that is not an identifier's initializer.
denial_set contains finding(call) if {
  file := input
  file.type == "SourceFileSyntax"
  walk(file, [path, call])
  call.type == "FunctionCallExprSyntax"
  not callee_name(call.children[0]) in identifier_types
  not callee_name(call.children[0]) in term_references
  some arguments in call.children
  arguments.type == "LabeledExprListSyntax"
  some argument in arguments.children
  some value in argument.children
  built_iri(value)
  not in_boundary_coder(file, path)
}

# `let v = "\(namespace)knows"`, `var u = ns + name`; not a static.
denial_set contains finding(value) if {
  file := input
  file.type == "SourceFileSyntax"
  walk(file, [path, decl])
  decl.type == "VariableDeclSyntax"
  not is_static(decl)
  some bindings in decl.children
  bindings.type == "PatternBindingListSyntax"
  some binding in bindings.children
  some initializer in binding.children
  initializer.type == "InitializerClauseSyntax"
  some value in initializer.children
  built_iri(value)
  not in_boundary_coder(file, path)
}

# `return "\(ns)\(name)"`
denial_set contains finding(value) if {
  file := input
  file.type == "SourceFileSyntax"
  walk(file, [path, statement])
  statement.type == "ReturnStmtSyntax"
  some value in statement.children
  built_iri(value)
  not in_boundary_coder(file, path)
}

# A node's path from `walk` alternates "children" and an index, so every
# prefix of even length is the path of an enclosing node.
in_boundary_coder(file, path) if {
  count(path) >= 2
  some half in numbers.range(1, count(path) / 2)
  boundary_coder(object.get(file, array.slice(path, 0, half * 2), {}))
}

# A format's coder type, named as Swift names coders (`TurtleDecoder`,
# `NTriplesEncoder`) or conforming to `Encoder`, `Decoder`,
# `TopLevelEncoder` or `TopLevelDecoder`; an extension of one; and a
# type's own `Codable` conformance: `encode(to:)` and `init(from:)`.
# DESIGN-CONTRACT.md rule 13: "Don't call things a serializer when they
# should be called encoder, decoder, and codable."
boundary_coder(decl) if {
  decl.type in {"StructDeclSyntax", "ClassDeclSyntax", "EnumDeclSyntax", "ActorDeclSyntax"}
  some token in decl.children
  token.type == "TokenSyntax"
  token.token.kind == "identifier"
  coder_name(token.token.text)
}

boundary_coder(decl) if {
  decl.type == "ExtensionDeclSyntax"
  some type in decl.children
  type.type in {"IdentifierTypeSyntax", "MemberTypeSyntax"}
  coder_name(type.children[count(type.children) - 1].token.text)
}

boundary_coder(decl) if {
  decl.type in {"StructDeclSyntax", "ClassDeclSyntax", "EnumDeclSyntax", "ActorDeclSyntax", "ExtensionDeclSyntax"}
  some clause in decl.children
  clause.type == "InheritanceClauseSyntax"
  walk(clause, [_, type])
  type.type in {"IdentifierTypeSyntax", "MemberTypeSyntax"}
  type.children[count(type.children) - 1].token.text in {"Encoder", "Decoder", "TopLevelEncoder", "TopLevelDecoder"}
}

# `func encode(to encoder: Encoder)`
boundary_coder(decl) if {
  decl.type == "FunctionDeclSyntax"
  some name in decl.children
  name.type == "TokenSyntax"
  name.token.kind == "identifier"
  name.token.text == "encode"
  first_parameter_label(decl) == "to"
}

# `init(from decoder: Decoder)`
boundary_coder(decl) if {
  decl.type == "InitializerDeclSyntax"
  first_parameter_label(decl) == "from"
}

coder_name(name) if regex.match(`(Encoder|Decoder)$`, name)

first_parameter_label(decl) := label if {
  some signature in decl.children
  signature.type == "FunctionSignatureSyntax"
  some clause in signature.children
  clause.type == "FunctionParameterClauseSyntax"
  some parameters in clause.children
  parameters.type == "FunctionParameterListSyntax"
  parameter := parameters.children[0]
  tokens := [token.token.text | some token in parameter.children; token.type == "TokenSyntax"]
  label := tokens[0]
}

finding(node) := {
  "rule_id": "semantickit.design_guidelines.no_interpolated_identity",
  "message": message,
  "line": node.range.start.line,
  "column": node.range.start.column,
  "severity": "error",
}

identifier_types := {"IRI", "URL", "URI", "NamedNode", "IRIRef", "Namespace"}

# `Range("http://…" + name)` is `no_term_reference_by_name`'s, which denies any
# string given to these, and is not reported here too.
term_references := {"Domain", "Range", "SubClassOf", "SubPropertyOf", "EquivalentClass", "EquivalentProperty", "InverseOf", "DisjointWith"}

# "http://example.org/\(name)", "\(namespace)knows"
built_iri(value) if {
  value.type == "StringLiteralExprSyntax"
  interpolated(value)
  iri_string(leading_text(value))
}

built_iri(value) if {
  value.type == "StringLiteralExprSyntax"
  some segments in value.children
  segments.type == "StringLiteralSegmentListSyntax"
  some segment in segments.children
  segment.type == "ExpressionSegmentSyntax"
  walk(segment, [_, reference])
  namespace_reference(reference)
}

# "http://example.org/" + name, ns + "knows", Foaf.namespace + name
built_iri(value) if {
  value.type == "SequenceExprSyntax"
  some list in value.children
  adds(list)
  some operand in list.children
  iri_operand(operand)
}

iri_operand(operand) if {
  operand.type == "StringLiteralExprSyntax"
  iri_string(leading_text(operand))
}

iri_operand(operand) if namespace_reference(operand)

iri_operand(operand) if {
  operand.type == "MemberAccessExprSyntax"
  namespace_reference(operand.children[count(operand.children) - 1])
}

adds(list) if {
  some operator in list.children
  operator.type == "BinaryOperatorExprSyntax"
  operator.children[0].token.text == "+"
}

interpolated(literal) if {
  some segments in literal.children
  segments.type == "StringLiteralSegmentListSyntax"
  some segment in segments.children
  segment.type == "ExpressionSegmentSyntax"
}

# `ns`, `namespace`, `Foaf.namespace`, `foafNS`, `baseIRI`, `vocabURL`
namespace_reference(reference) if {
  reference.type == "DeclReferenceExprSyntax"
  namespace_name(reference.children[0].token.text)
}

namespace_name(name) if lower(name) in {"ns", "namespace", "iri", "uri", "url", "vocab", "vocabulary"}

namespace_name(name) if regex.match(`[a-z0-9](Namespace|NS|IRI|Iri|URI|Uri|URL|Url)$`, name)

leading_text(literal) := text if {
  some segments in literal.children
  segments.type == "StringLiteralSegmentListSyntax"
  segment := segments.children[0]
  segment.type == "StringSegmentSyntax"
  text := segment.children[0].token.text
}

# "http://xmlns.com/foaf/0.1/", "urn:", "foaf:"
iri_string(text) if regex.match(`^[A-Za-z][A-Za-z0-9+.-]*:[^\s]*$`, text)

is_static(decl) if {
  some modifiers in decl.children
  modifiers.type == "DeclModifierListSyntax"
  some modifier in modifiers.children
  modifier.children[0].token.text in {"static", "class"}
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
