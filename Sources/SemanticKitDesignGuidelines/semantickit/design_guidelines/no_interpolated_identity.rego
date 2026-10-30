package semantickit.design_guidelines.no_interpolated_identity

# An IRI built by string interpolation or concatenation (`+`, `appending(_:)`,
# `joined()`, `String(format:)`) is identity built
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
# Each node's `context`, the declarations around it, tells whether it sits
# inside a boundary coder.
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

# `IRI(rawValue: "\(namespace)\(name)")`, `URL(string: base + name)`
denial_set contains finding(call) if {
  some call in input.functionCallExprs
  callee_name(call) in identifier_types
  built_from_strings(call.arguments)
  not in_boundary_coder(call)
}

# `Term("http://example.org/" + name)`, `print("\(ns)knows")`: a built IRI
# string given to a call that is not an identifier's initializer.
denial_set contains finding(call) if {
  some call in input.functionCallExprs
  not callee_name(call) in identifier_types
  not callee_name(call) in term_references
  some argument in call.arguments
  built_iri(argument.expression)
  not in_boundary_coder(call)
}

# `let v = "\(namespace)knows"`, `var u = ns + name`; not a static.
denial_set contains finding_at(binding.initializer.value) if {
  some decl in input.variableDecls
  not is_static(decl)
  some binding in decl.bindings
  built_iri(binding.initializer.value)
  not in_boundary_coder(decl)
}

# `return "\(ns)\(name)"`
denial_set contains finding_at(statement.expression) if {
  some statement in input.returnStmts
  built_iri(statement.expression)
  not in_boundary_coder(statement)
}

in_boundary_coder(node) if {
  some declaration in node.context
  boundary_coder(declaration)
}

# A format's coder type, named as Swift names coders (`TurtleDecoder`,
# `NTriplesEncoder`) or conforming to `Encoder`, `Decoder`,
# `TopLevelEncoder` or `TopLevelDecoder`; an extension of one; and a
# type's own `Codable` conformance: `encode(to:)` and `init(from:)`.
# DESIGN-CONTRACT.md rule 13: "Don't call things a serializer when they
# should be called encoder, decoder, and codable."
boundary_coder(declaration) if coder_name(type_declaration(declaration).name)

boundary_coder(declaration) if coder_name(type_name(declaration.extensionDecl.extendedType))

boundary_coder(declaration) if {
  some inherited in type_declaration(declaration).inheritanceClause.inheritedTypes
  type_name(inherited.type) in coder_protocols
}

boundary_coder(declaration) if {
  some inherited in declaration.extensionDecl.inheritanceClause.inheritedTypes
  type_name(inherited.type) in coder_protocols
}

# `func encode(to encoder: Encoder)`
boundary_coder(declaration) if {
  function := declaration.functionDecl
  function.name == "encode"
  function.signature.parameterClause.parameters[0].firstName == "to"
}

# `init(from decoder: Decoder)`
boundary_coder(declaration) if declaration.initializerDecl.signature.parameterClause.parameters[0].firstName == "from"

type_declaration(declaration) := declaration.structDecl

type_declaration(declaration) := declaration.classDecl

type_declaration(declaration) := declaration.enumDecl

type_declaration(declaration) := declaration.actorDecl

coder_protocols := {"Encoder", "Decoder", "TopLevelEncoder", "TopLevelDecoder"}

coder_name(name) if regex.match(`(Encoder|Decoder)$`, name)

# `TurtleDecoder`, `Formats.TurtleDecoder`
type_name(type) := type.identifierType.name

type_name(type) := type.memberType.name

finding(node) := {
  "rule_id": "semantickit.design_guidelines.no_interpolated_identity",
  "message": message,
  "line": node.range.start.line,
  "column": node.range.start.column,
  "severity": "error",
}

# An expression is `{"<kind>": node}`; the finding is at the node.
finding_at(expression) := finding(node) if some node in expression

identifier_types := {"IRI", "URL", "URI", "NamedNode", "IRIRef", "Namespace"}

# `Range("http://…" + name)` is `no_term_reference_by_name`'s, which denies any
# string given to these, and is not reported here too.
term_references := {"Domain", "Range", "SubClassOf", "SubPropertyOf", "EquivalentClass", "EquivalentProperty", "InverseOf", "DisjointWith"}

# "http://example.org/\(name)", "\(namespace)knows"
built_iri(value) if {
  literal := value.stringLiteralExpr
  interpolated(literal)
  iri_string(leading_text(literal))
}

built_iri(value) if {
  some segment in value.stringLiteralExpr.segments
  walk(segment.expressionSegment, [_, reference])
  namespace_reference(reference)
}

# "http://example.org/" + name, ns + "knows", Foaf.namespace + name
built_iri(value) if {
  value.infixOperatorExpr.operator.binaryOperatorExpr.operator == "+"
  some operand in sum_operands(value)
  iri_operand(operand)
}

# `ns.appending("knows")`, `[ns, "knows"].joined()`,
# `String(format: "%@knows", ns)`
built_iri(value) if {
  string_building_call(value.functionCallExpr)
  walk(value, [_, operand])
  iri_operand(operand)
}

# The operands of a sum: `a`, `b` and `c` in `a + b + c`.
sum_operands(value) := {operand |
  walk(value, [path, operand])
  count(path) > 0
  every step in path {
    step in {"infixOperatorExpr", "leftOperand", "rightOperand"}
  }
  path[count(path) - 1] in {"leftOperand", "rightOperand"}
}

iri_operand(operand) if iri_string(leading_text(operand.stringLiteralExpr))

iri_operand(operand) if namespace_reference(operand)

# `ns`, `namespace`, `Foaf.namespace`, `foafNS`, `baseIRI`, `vocabURL`
namespace_reference(reference) if namespace_name(reference.declReferenceExpr.baseName)

namespace_reference(reference) if namespace_name(reference.memberAccessExpr.declName.baseName)

namespace_name(name) if lower(name) in {"ns", "namespace", "iri", "uri", "url", "vocab", "vocabulary"}

namespace_name(name) if regex.match(`[a-z0-9](Namespace|NS|IRI|Iri|URI|Uri|URL|Url)$`, name)

interpolated(literal) if {
  some segment in literal.segments
  segment.expressionSegment
}

# The text before any interpolation: "http://example.org/" in
# "http://example.org/\(name)".
leading_text(literal) := literal.segments[0].stringSegment.content

# "http://xmlns.com/foaf/0.1/", "urn:", "foaf:"
iri_string(text) if regex.match(`^[A-Za-z][A-Za-z0-9+.-]*:[^\s]*$`, text)

is_static(decl) if {
  some modifier in decl.modifiers
  modifier.name in {"static", "class"}
}

built_from_strings(arguments) if {
  walk(arguments, [_, node])
  node.expressionSegment
}

built_from_strings(arguments) if {
  walk(arguments, [_, node])
  node.infixOperatorExpr.operator.binaryOperatorExpr.operator == "+"
}

built_from_strings(arguments) if {
  walk(arguments, [_, node])
  string_building_call(node.functionCallExpr)
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
