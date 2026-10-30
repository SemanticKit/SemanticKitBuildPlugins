package semantickit.design_guidelines.no_static_term_enum

# Terms held as static constants on a type are a static container of terms. A
# term is declared in the ontology and becomes its own type; it is never a
# constant on an enum, a struct, a class or an extension. Denied:
# - on any enum, struct, class, actor or extension: a static property set to a
#   term (`Term(...)`, `Property(...)`, `Class(...)` and the other declaration
#   kinds), to an IRI or prefixed-name string ("http://...", "foaf:knows"), or
#   to a string spelling its own name (`static let knows = "knows"`), or a
#   static function returning a term;
# - on an enum, a static property typed `IRI` or a term kind;
# - an enum named as a term container (`FoafTerm`, `FoafTerms`,
#   `FoafVocabulary`, `FoafProperties`, `FoafClasses`, ...) with cases or
#   statics: `enum FoafTerm: String { case knows, person }`;
# - a String-raw enum whose raw values are IRIs or prefixed names, or the
#   term's local name (`case animal = "Animal"`).
# Not denied: String-raw enums that are not term mappings, such as
# `CodingKeys` (Codable, contract rule 13) and spec value sets such as RDF 1.2
# base direction (`enum TextDirection: String { case ltr, rtl }`); string
# constants that are not terms (`static let mediaType = "text/turtle"`).
# DESIGN-CONTRACT.md rule 3 (Charles): "No static mapping onto enums, structs
# and statics." RDFKit DslInvariants: no static enum-style term containers.

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

message := "Do not keep terms as static constants or String raw values on a type; declare the term in the ontology so that it is its own type."

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
  some bindings in member.children
  bindings.type == "PatternBindingListSyntax"
  some binding in bindings.children
  binding_name(binding) != "iri"
  some annotation in binding.children
  annotation.type == "TypeAnnotationSyntax"
  some type in annotation.children
  type_name(type) in term_types
}

# `enum FoafTerm`, `enum FoafVocabulary`, `enum Properties`
term_container_name(decl) if regex.match(`(Term|Terms|Vocabulary|Vocabularies|Vocab|Property|Properties|Predicate|Predicates|Class|Classes|Concept|Concepts)$`, declared_name(decl))

container_member(member) if member.type == "EnumCaseDeclSyntax"

container_member(member) if {
  member.type in {"VariableDeclSyntax", "FunctionDeclSyntax"}
  is_static(member)
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

# `static func knows() -> Term`
term_function(member) if {
  member.type == "FunctionDeclSyntax"
  is_static(member)
  some signature in member.children
  signature.type == "FunctionSignatureSyntax"
  some clause in signature.children
  clause.type == "ReturnClauseSyntax"
  some type in clause.children
  type_name(type) in term_kinds
}

term_value(value, _) if iri_string(string_literal_text(value))

# `static let knows = "knows"`: the term's name as its value.
term_value(value, name) if string_literal_text(value) == name

term_value(value, _) if {
  value.type == "FunctionCallExprSyntax"
  callee_name(value.children[0]) in term_kinds
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
