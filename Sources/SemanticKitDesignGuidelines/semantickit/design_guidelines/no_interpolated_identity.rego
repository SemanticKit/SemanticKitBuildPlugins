package semantickit.design_guidelines.no_interpolated_identity

# An IRI built by string interpolation or concatenation is identity built
# from strings at run time. Denied anywhere in a target the rules run on
# (boundary encoders and decoders live in targets they do not run on):
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
# DESIGN-CONTRACT.md rule 2 (Charles): "Types never communicate through IRI
# strings." Binding identity rule: "identity built by string interpolation
# [is a] design error." An IRI on a type is a projection computed from its
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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee_name(call.children[0]) in identifier_types
  some arguments in call.children
  arguments.type == "LabeledExprListSyntax"
  built_from_strings(arguments)
}

# `Term("http://example.org/" + name)`, `print("\(ns)knows")`: a built IRI
# string given to a call that is not an identifier's initializer.
denial_set contains finding(call) if {
  call := input
  call.type == "FunctionCallExprSyntax"
  not callee_name(call.children[0]) in identifier_types
  not callee_name(call.children[0]) in term_references
  some arguments in call.children
  arguments.type == "LabeledExprListSyntax"
  some argument in arguments.children
  some value in argument.children
  built_iri(value)
}

# `let v = "\(namespace)knows"`, `var u = ns + name`; not a static.
denial_set contains finding(value) if {
  decl := input
  decl.type == "VariableDeclSyntax"
  not is_static(decl)
  some bindings in decl.children
  bindings.type == "PatternBindingListSyntax"
  some binding in bindings.children
  some initializer in binding.children
  initializer.type == "InitializerClauseSyntax"
  some value in initializer.children
  built_iri(value)
}

# `return "\(ns)\(name)"`
denial_set contains finding(value) if {
  statement := input
  statement.type == "ReturnStmtSyntax"
  some value in statement.children
  built_iri(value)
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
