package semantickit.design_guidelines.no_static_term_enum

# Terms held as static constants on a type, or as the cases of an enum, are a
# static container of terms. A term is declared in the ontology and becomes its
# own type; it is never a constant on an enum, a struct, a class or an
# extension, and never an enum case. Denied:
# - on any enum, struct, class, actor or extension: a static property set to a
#   term (`Term(...)`, `Property(...)`, `Class(...)` and the other declaration
#   kinds), to an instance of the type it is named after
#   (`static let animal = Animal()`), to a string spelling its own name
#   (`static let knows = "knows"`), or a static function without parameters
#   returning a term;
# - on any enum: a static stored property (`enum Fauna { static let animal =
#   ... }`), or a static typed `IRI` or a term kind;
# - an enum named or documented as a vocabulary with cases or statics:
#   `enum Foaf { case knows, person, agent }`, `enum FoafTerm: String { case
#   knows }`, `/// The FOAF vocabulary.` on `enum Friend { case knows }`. A
#   vocabulary name is a prefix of a published vocabulary (`Foaf`, `RDFS`,
#   `Schema`, ...) or ends in `Term(s)`, `Vocabulary`, `Vocab`, `Ontology`,
#   `Namespace`, `Properties`, `Classes`, ...; vocabulary documentation names
#   a vocabulary, an ontology or a namespace;
# - a struct, class, actor or extension named or documented as a vocabulary
#   with a static stored property: `extension Foaf { static let knows = ... }`;
# - a String-raw enum whose raw values are IRIs or prefixed names, or the
#   term's local name (`case animal = "Animal"`).
# A static whose value is an IRI however built (`URL(string: "...")`,
# `"\(ns)knows"`) is `no_static_iri_constant`'s, and is not reported here too.
# Not denied: String-raw enums that are not term mappings, such as
# `CodingKeys` (Codable, contract rule 13) and spec value sets such as RDF 1.2
# base direction (`enum TextDirection: String { case ltr, rtl }`); string
# constants that are not terms on a struct (`static let mediaType =
# "text/turtle"`); result builders (`static func buildBlock`).
# DESIGN-CONTRACT.md rule 3 (Charles): "No static mapping onto enums, structs
# and statics." "I see static properties on some other thing. Like, you're
# writing an enum type. Which makes no fucking sense, compositionally
# speaking." RDFKit DslInvariants: no static enum-style term containers.

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

message := "Do not keep terms as static constants, enum cases or String raw values on a type; declare the term in the ontology so that it is its own type."

denial_set contains finding(decl) if {
  decl := input
  decl.type == "EnumDeclSyntax"
  some member in members(decl)
  enum_term_constant(member)
}

denial_set contains finding(decl) if {
  decl := input
  decl.type == "EnumDeclSyntax"
  term_container_name(decl)
  some member in members(decl)
  container_member(member)
}

# `enum Fauna { static let animal = Animal() }`: any stored static on an enum.
denial_set contains finding(decl) if {
  decl := input
  decl.type == "EnumDeclSyntax"
  some member in members(decl)
  stored_static(member)
}

# `/// The FOAF vocabulary.` before `enum Friend { case knows }`
denial_set contains finding(decl) if {
  decl := input
  decl.type == "EnumDeclSyntax"
  vocabulary_documentation(decl)
  some member in members(decl)
  container_member(member)
}

# `extension Foaf { static let knows = Knows() }`, `struct Schema { static let
# name = ... }`: a stored static on a type named or documented as a vocabulary.
denial_set contains finding(decl) if {
  decl := input
  decl.type == "StructDeclSyntax"
  vocabulary_type(decl)
  some member in members(decl)
  stored_static(member)
}

denial_set contains finding(decl) if {
  decl := input
  decl.type == "ClassDeclSyntax"
  vocabulary_type(decl)
  some member in members(decl)
  stored_static(member)
}

denial_set contains finding(decl) if {
  decl := input
  decl.type == "ActorDeclSyntax"
  vocabulary_type(decl)
  some member in members(decl)
  stored_static(member)
}

denial_set contains finding(decl) if {
  decl := input
  decl.type == "ExtensionDeclSyntax"
  vocabulary_type(decl)
  some member in members(decl)
  stored_static(member)
}

denial_set contains finding(decl) if {
  decl := input
  decl.type == "EnumDeclSyntax"
  inherits(decl, "String")
  not inherits(decl, "CodingKey")
  some member in members(decl)
  term_raw_value(member)
}

denial_set contains finding(decl) if {
  decl := input
  decl.type == "ExtensionDeclSyntax"
  some member in members(decl)
  term_constant(member)
}

denial_set contains finding(decl) if {
  decl := input
  decl.type == "StructDeclSyntax"
  some member in members(decl)
  term_constant(member)
}

denial_set contains finding(decl) if {
  decl := input
  decl.type == "ClassDeclSyntax"
  some member in members(decl)
  term_constant(member)
}

denial_set contains finding(decl) if {
  decl := input
  decl.type == "ActorDeclSyntax"
  some member in members(decl)
  term_constant(member)
}

finding(decl) := {
  "rule_id": "semantickit.design_guidelines.no_static_term_enum",
  "message": message,
  "line": decl.range.start.line,
  "column": decl.range.start.column,
  "severity": "error",
}

# The declarations directly inside the type's member block.
members(decl) := [member |
  some block in decl.children
  block.type == "MemberBlockSyntax"
  some list in block.children
  list.type == "MemberBlockItemListSyntax"
  some item in list.children
  member := item.children[0]
]

enum_term_constant(member) if term_constant(member)

# `static var readClass: IRI { ... }`, `static let knows: Property`: but not
# the type's own projection, `static var iri: IRI { ... }`.
enum_term_constant(member) if {
  member.type == "VariableDeclSyntax"
  is_static(member)
  not iri_valued(member)
  not iri_valued(member)
  some bindings in member.children
  bindings.type == "PatternBindingListSyntax"
  some binding in bindings.children
  binding_name(binding) != "iri"
  some annotation in binding.children
  annotation.type == "TypeAnnotationSyntax"
  some type in annotation.children
  type_name(type) in term_types
}

# `enum FoafTerm`, `enum FoafVocabulary`, `enum Properties`, `enum Foaf`,
# `enum RDFS`, or an enum documented as a vocabulary.
term_container_name(decl) if regex.match(`(Term|Terms|Vocabulary|Vocabularies|Vocab|Ontology|Ontologies|Namespace|NS|Property|Properties|Predicate|Predicates|Class|Classes|Concept|Concepts)$`, declared_name(decl))

term_container_name(decl) if lower(declared_name(decl)) in vocabulary_prefixes

vocabulary_type(decl) if term_container_name(decl)

vocabulary_type(decl) if vocabulary_documentation(decl)

vocabulary_type(decl) if {
  decl.type == "ExtensionDeclSyntax"
  extended := decl.children[3]
  extended.type == "IdentifierTypeSyntax"
  name := extended.children[0].token.text
  vocabulary_name(name)
}

vocabulary_name(name) if regex.match(`(Term|Terms|Vocabulary|Vocabularies|Vocab|Ontology|Ontologies|Namespace|NS|Properties|Predicates|Classes|Concepts)$`, name)

vocabulary_name(name) if lower(name) in vocabulary_prefixes

# The doc comment before the declaration's first token names a vocabulary, an
# ontology or a namespace: `/// The FOAF vocabulary.`
vocabulary_documentation(decl) if {
  walk(decl, [_, token])
  token.type == "TokenSyntax"
  token.range.start == decl.range.start
  regex.match(`(?i)\b(vocabular(y|ies)|ontolog(y|ies)|namespaces?)\b`, token.token.documentation)
}

# The prefixes of published vocabularies: the W3C RDFa initial context, and the
# vocabularies Solid, WebID and ActivityPub use.
vocabulary_prefixes := {
  "as", "acl", "cc", "cert", "csvw", "ctag", "dc", "dcat", "dcterms", "dct", "doap",
  "dqv", "duv", "foaf", "geo", "gr", "grddl", "ical", "interact", "ldp", "ma",
  "oa", "odrl", "og", "org", "owl", "pim", "prov", "qb", "rdf", "rdfa", "rdfs",
  "rev", "rif", "rr", "schema", "sd", "sh", "shacl", "sioc", "skos", "skosxl",
  "solid", "sosa", "ssn", "time", "vcard", "void", "wdr", "wdrs", "xhv", "xml",
  "xsd", "activitystreams",
}

# A stored static property: `static let`, or `static var` with a value and no
# accessors.
stored_static(member) if {
  member.type == "VariableDeclSyntax"
  is_static(member)
  not iri_valued(member)
  some bindings in member.children
  bindings.type == "PatternBindingListSyntax"
  some binding in bindings.children
  not accessor(binding)
}

accessor(binding) if {
  some block in binding.children
  block.type == "AccessorBlockSyntax"
}

container_member(member) if member.type == "EnumCaseDeclSyntax"

container_member(member) if {
  member.type in {"VariableDeclSyntax", "FunctionDeclSyntax"}
  is_static(member)
  not iri_valued(member)
}

# `case knows = "http://xmlns.com/foaf/0.1/knows"`, `case knows = "foaf:knows"`,
# `case animal = "Animal"`
term_raw_value(member) if {
  member.type == "EnumCaseDeclSyntax"
  some elements in member.children
  elements.type == "EnumCaseElementListSyntax"
  some element in elements.children
  some raw in element.children
  raw.type == "InitializerClauseSyntax"
  some value in raw.children
  text := string_literal_text(value)
  term_string(text, element.children[0].token.text)
}

term_string(text, _) if iri_string(text)

# The case's own name, as a class's local name: `animal` = "Animal".
term_string(text, name) if {
  text != name
  lower(text) == lower(name)
  regex.match(`^[A-Z]`, text)
}

# "http://xmlns.com/foaf/0.1/knows", "foaf:knows"
iri_string(text) if regex.match(`^[A-Za-z][A-Za-z0-9+.-]*:[^\s]+$`, text)

# `static let knows = Term("knows")`, `static let knows = "knows"`
term_constant(member) if {
  member.type == "VariableDeclSyntax"
  is_static(member)
  not iri_valued(member)
  some bindings in member.children
  bindings.type == "PatternBindingListSyntax"
  some binding in bindings.children
  some initializer in binding.children
  initializer.type == "InitializerClauseSyntax"
  some value in initializer.children
  some form in forms(value)
  term_value(form, binding_name(binding))
}

term_constant(member) if term_function(member)

# `static func knows() -> Term`: a term constant spelled as a function. A
# static function that takes parameters, such as a decoder's
# `static func term(from token: String) -> Term`, turns its arguments into a
# term and is not a constant.
term_function(member) if {
  member.type == "FunctionDeclSyntax"
  is_static(member)
  some signature in member.children
  signature.type == "FunctionSignatureSyntax"
  not has_parameters(signature)
  some clause in signature.children
  clause.type == "ReturnClauseSyntax"
  some type in clause.children
  type_name(type) in term_kinds
}

has_parameters(signature) if {
  some clause in signature.children
  clause.type == "FunctionParameterClauseSyntax"
  some parameters in clause.children
  parameters.type == "FunctionParameterListSyntax"
  count(parameters.children) > 0
}

term_value(value, _) if iri_string(string_literal_text(value))

# `static let knows = "knows"`: the term's name as its value.
term_value(value, name) if string_literal_text(value) == name

term_value(value, _) if {
  value.type == "FunctionCallExprSyntax"
  callee_name(value.children[0]) in term_kinds
}

# `static let animal = Animal()`: an instance of the type the constant names.
term_value(value, name) if {
  value.type == "FunctionCallExprSyntax"
  callee := callee_name(value.children[0])
  name != ""
  lower(callee) == lower(name)
  callee != name
}

is_static(decl) if {
  some modifiers in decl.children
  modifiers.type == "DeclModifierListSyntax"
  some modifier in modifiers.children
  modifier.children[0].token.text in {"static", "class"}
}

# `enum X: String`, `enum X: Swift.String, Sendable`, `enum CodingKeys: String, CodingKey`
inherits(decl, name) if {
  some clause in decl.children
  clause.type == "InheritanceClauseSyntax"
  some list in clause.children
  list.type == "InheritedTypeListSyntax"
  some inherited in list.children
  type_name(inherited.children[0]) == name
}

declared_name(decl) := name.token.text if {
  some name in decl.children
  name.type == "TokenSyntax"
  name.token.kind == "identifier"
}

binding_name(binding) := binding.children[0].children[0].token.text if binding.children[0].type == "IdentifierPatternSyntax"

# The text of a string literal with one plain segment.
string_literal_text(literal) := text if {
  literal.type == "StringLiteralExprSyntax"
  some segments in literal.children
  segments.type == "StringLiteralSegmentListSyntax"
  count(segments.children) == 1
  segment := segments.children[0]
  segment.type == "StringSegmentSyntax"
  text := segment.children[0].token.text
}

type_name(type) := type.children[0].token.text if type.type == "IdentifierTypeSyntax"

type_name(type) := name.token.text if {
  type.type == "MemberTypeSyntax"
  some name in type.children
  name.type == "TokenSyntax"
  name.token.kind == "identifier"
}

term_types := term_kinds | {"IRI"}

term_kinds := {
  "Term",
  "Property",
  "Class",
  "ObjectProperty",
  "DatatypeProperty",
  "AnnotationProperty",
  "Datatype",
  "Individual",
  "NamedIndividual",
}

# The expression, and what `try`, `try!`, `await` and `!` wrap, two levels deep.
wrappers := {"TryExprSyntax", "AwaitExprSyntax", "ForceUnwrapExprSyntax", "OptionalChainingExprSyntax"}

forms(value) := {value} | inner(value) | {deeper | some form in inner(value); some deeper in inner(form)}

inner(value) := {child |
  value.type in wrappers
  some child in value.children
  child.type != "TokenSyntax"
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

# The statics `no_static_iri_constant` reports: typed as an identifier, or
# valued with an identifier's initializer, an IRI string, an interpolated
# string or a `+` with a string. Kept in step with that policy, so that one
# static is reported once.
iri_valued(member) if {
  some bindings in member.children
  bindings.type == "PatternBindingListSyntax"
  some binding in bindings.children
  iri_binding(binding)
}

iri_binding(binding) if {
  not iri_projection(binding)
  some annotation in binding.children
  annotation.type == "TypeAnnotationSyntax"
  some type in annotation.children
  identifier_type(type)
}

iri_binding(binding) if {
  some clause in binding.children
  clause.type in {"InitializerClauseSyntax", "AccessorBlockSyntax"}
  some value in clause.children
  value.type != "TokenSyntax"
  iri_value(value)
}

iri_projection(binding) if {
  binding_name(binding) == "iri"
  accessor(binding)
  not initialized(binding)
}

initialized(binding) if {
  some initializer in binding.children
  initializer.type == "InitializerClauseSyntax"
}

identifier_type(type) if named_identifier(type)

identifier_type(type) if {
  type.type in {"OptionalTypeSyntax", "ImplicitlyUnwrappedOptionalTypeSyntax"}
  named_identifier(type.children[0])
}

named_identifier(type) if type_name(type) in identifier_types

identifier_types := {"IRI", "URL", "URI", "NamedNode", "IRIRef"}

iri_value(value) if {
  walk(value, [_, call])
  call.type == "FunctionCallExprSyntax"
  callee_name(call.children[0]) in identifier_types
}

iri_value(value) if {
  walk(value, [_, literal])
  literal.type == "StringLiteralExprSyntax"
  iri_string(leading_text(literal))
}

iri_value(value) if {
  walk(value, [_, segment])
  segment.type == "ExpressionSegmentSyntax"
}

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

leading_text(literal) := text if {
  some segments in literal.children
  segments.type == "StringLiteralSegmentListSyntax"
  segment := segments.children[0]
  segment.type == "StringSegmentSyntax"
  text := segment.children[0].token.text
}
