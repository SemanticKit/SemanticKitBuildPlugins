package semantickit.design_guidelines.no_static_iri_constant

# A static property whose value is an IRI is a term held as an IRI constant
# (`ACL.readClass`), however the IRI is built. A file-scope constant is
# lazily initialised static storage too, and so is a function without
# parameters that returns one IRI. Denied:
# - a static or class property, stored or computed, including a type's own
#   `static var iri: IRI { … }`:
#   - typed as an identifier: `IRI`, `URL`, `URI`, `NamedNode`, `IRIRef`,
#     also optional or module-qualified (`IRIKit.IRI?`);
#   - a value that calls an identifier's initializer or one of its static
#     factories anywhere in it: `URL(string: "…")!`,
#     `try! IRI(validating: "…")`, `NamedNode("…")`, `IRIKit.IRI.init(…)`,
#     `IRI.foaf("knows")`, `IRI.knows`;
#   - a value that holds an absolute IRI or a prefixed name as a string,
#     passed to any initializer or held bare: `"http://…"`,
#     `Namespace("http://…")`, `Prefix("owl", "http://…")`, `"foaf:knows"`;
#   - a value that builds a string or a URL: by interpolation
#     (`"\(ns)knows"`), by `+` with a string or a namespace (`ns + "knows"`,
#     `ns + local`), by a call that builds a string (`ns.appending("knows")`,
#     `[ns, "knows"].joined()`, `String(format: "%@knows", ns)`), or by a URL
#     path call (`ns.appending(path: "knows")`,
#     `ns.appendingPathComponent("knows")`);
# - a file-scope `let` or `var` typed as an identifier, or set to an
#   identifier's initializer or factory or to an IRI string:
#   `let knows = IRI(rawValue: "http://…")`, `let knows = URL(string: "…")!`.
#   One built from strings (`IRI(rawValue: "\(ns)\(name)")`) is
#   `no_interpolated_identity`'s, and an IRI given to a term reference or used
#   as a dictionary key is `no_term_reference_by_name`'s or
#   `no_term_registry`'s;
# - a file-scope or static function without parameters that returns an
#   identifier built as above: `func knows() -> IRI { IRI(rawValue: "http://…") }`.
# An IRI is derived from the declaration's ontology and namespace when a
# coder, translator or comparison asks for it, never declared.
# DESIGN-CONTRACT.md rule 17 (Charles): "in no way, shape, or form should a
# declared class or other thing that comes from an RDF type statically
# declare a fucking IRI." Rule 2: "Types never communicate through IRI
# strings. IRIs exist only at the boundary." Rule 3: "No static mapping onto
# enums, structs and statics."

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

finding(node) := {
  "rule_id": "semantickit.design_guidelines.no_static_iri_constant",
  "message": "Do not hold a term as a static or file-scope IRI, URL or IRI string, however it is built; the term's type is its identity, and its IRI is derived from its declaration only at the boundary.",
  "line": node.range.start.line,
  "column": node.range.start.column,
  "severity": "error",
}

denial_set contains finding(decl) if {
  some decl in input.variableDecls
  is_static(decl)
  some binding in decl.bindings
  iri_binding(binding)
}

# `let knows = IRI(rawValue: "http://…")` at file scope.
denial_set contains finding(decl) if {
  some decl in input.variableDecls
  file_scope(decl)
  some binding in decl.bindings
  file_scope_iri_binding(binding)
}

# `func knows() -> IRI { IRI(rawValue: "http://…") }`
denial_set contains finding(function) if {
  some function in input.functionDecls
  constant_function(function)
  not function.signature.parameterClause.parameters
  iri_type(function.signature.returnClause.type)
  iri_value(function.body)
}

is_static(decl) if {
  some modifier in decl.modifiers
  modifier.name in {"static", "class"}
}

# Declared outside every type, extension and function.
file_scope(decl) if not decl.context

constant_function(function) if file_scope(function)

constant_function(function) if is_static(function)

# `static let knows: IRI`, `: URL?`, `: IRIKit.IRI!`, `static var iri: IRI { … }`
iri_binding(binding) if iri_type(binding.typeAnnotation.type)

iri_binding(binding) if {
  some value in values(binding)
  iri_value(value)
}

# What the property is set to, or what its accessors compute.
values(binding) := {value | value := binding.initializer.value} | {block | block := binding.accessorBlock}

file_scope_iri_binding(binding) if {
  iri_type(binding.typeAnnotation.type)
  not built(binding.initializer.value)
}

# The value itself is the IRI, not an argument or a key of something else.
file_scope_iri_binding(binding) if {
  value := binding.initializer.value
  some form in forms(value)
  constant_iri(form)
  not built(value)
}

constant_iri(form) if callee_name(form.functionCallExpr) in identifier_types

constant_iri(form) if identifier_factory(form.functionCallExpr)

constant_iri(form) if iri_string(string_literal_text(form))

# Built from strings: `no_interpolated_identity`'s.
built(value) if {
  walk(value, [_, node])
  node.expressionSegment
}

built(value) if {
  walk(value, [_, node])
  node.infixOperatorExpr.operator.binaryOperatorExpr.operator == "+"
}

built(value) if {
  walk(value, [_, node])
  string_building_call(node.functionCallExpr)
}

# `URL(string: "…")!`, `try! IRI(validating: "…")`, `{ NamedNode("…") }()`
iri_value(value) if {
  walk(value, [_, node])
  callee_name(node.functionCallExpr) in identifier_types
}

# `IRI.foaf("knows")`, `IRIKit.IRI.named("knows")`, `IRI.knows`: a static
# factory or constant of an identifier type.
iri_value(value) if {
  walk(value, [_, node])
  access := node.memberAccessExpr
  access.declName.baseName != "init"
  reference_name(access.base) in identifier_types
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

# `ns + "knows"`, `"http://…" + name`, `ns + local`, `Foaf.namespace + name`
iri_value(value) if {
  walk(value, [_, node])
  operation := node.infixOperatorExpr
  operation.operator.binaryOperatorExpr.operator == "+"
  some operand in [operation.leftOperand, operation.rightOperand]
  string_or_namespace(operand)
}

# `ns.appending("knows")`, `[ns, "knows"].joined()`, `String(format: "%@knows", ns)`
iri_value(value) if {
  walk(value, [_, node])
  call := node.functionCallExpr
  string_building_call(call)
  walk(call, [_, literal])
  literal.stringLiteralExpr
}

# `ns.appending(path: "knows")`, `ns.appendingPathComponent("knows")`: a
# static URL built from a base is a term IRI.
iri_value(value) if {
  walk(value, [_, node])
  node.functionCallExpr.calledExpression.memberAccessExpr.declName.baseName in url_building_calls
}

url_building_calls := {"appending", "appendingPathComponent", "appendingPathExtension"}

string_or_namespace(operand) if operand.stringLiteralExpr

string_or_namespace(operand) if namespace_reference(operand)

# `ns`, `namespace`, `Foaf.namespace`, `foafNS`, `baseIRI`, `vocabURL`; the
# names `no_interpolated_identity` reads as a namespace.
namespace_reference(reference) if namespace_name(reference.declReferenceExpr.baseName)

namespace_reference(reference) if namespace_name(reference.memberAccessExpr.declName.baseName)

namespace_name(name) if lower(name) in {"ns", "namespace", "iri", "uri", "url", "vocab", "vocabulary"}

namespace_name(name) if regex.match(`[a-z0-9](Namespace|NS|IRI|Iri|URI|Uri|URL|Url)$`, name)

# `IRI.foaf(…)`, `IRIKit.IRI.named(…)`: a static factory of an identifier.
identifier_factory(call) if {
  access := call.calledExpression.memberAccessExpr
  access.declName.baseName != "init"
  reference_name(access.base) in identifier_types
}

# `ns.appending("knows")`, `[ns, "knows"].joined()`, `String(format: "%@knows",
# ns)`: a string built by a call rather than by `+`.
string_building_call(call) if call.calledExpression.memberAccessExpr.declName.baseName == "joined"

string_building_call(call) if {
  call.calledExpression.memberAccessExpr.declName.baseName == "appending"
  [argument] := call.arguments
  not argument.label
}

string_building_call(call) if {
  call.calledExpression.declReferenceExpr.baseName == "String"
  some argument in call.arguments
  argument.label == "format"
}

iri_type(type) if named_iri(type)

iri_type(type) if named_iri(type.optionalType.wrappedType)

iri_type(type) if named_iri(type.implicitlyUnwrappedOptionalType.wrappedType)

named_iri(type) if type.identifierType.name in identifier_types

named_iri(type) if type.memberType.name in identifier_types

identifier_types := {"IRI", "URL", "URI", "NamedNode", "IRIRef"}

# The text of a string literal with one plain segment.
string_literal_text(expression) := segment.stringSegment.content if {
  [segment] := expression.stringLiteralExpr.segments
}

# The expression, and what `try`, `try!`, `await`, `!` and `?` wrap, two
# levels deep.
forms(value) := {value} | inner(value) | {deeper | some form in inner(value); some deeper in inner(form)}

inner(value) := (({child | child := value.tryExpr.expression} | {child | child := value.awaitExpr.expression}) | {child | child := value.forceUnwrapExpr.expression}) | {child | child := value.optionalChainingExpr.expression}

# The text before any interpolation: "http://example.org/" in
# "http://example.org/\(name)".
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
