package semantickit.design_guidelines.no_static_term_enum

# Terms held as static constants on a type are a static container of terms. A
# term is declared in the ontology and becomes its own type; it is never a
# constant on an enum, a struct, a class or an extension.
# - An enum with any static property, a static function returning a term, or a
#   String raw value (explicit, `case animal = "Animal"`, or implicit,
#   `enum FoafTerm: String { case knows }`) is denied.
# - A struct, class, actor or extension with a static stored property set to a
#   term (`Term(…)`, `Property(…)`, `Class(…)` and the other declaration
#   kinds) or to a string literal, or a static function returning a term, is
#   denied. Statics IRI-typed are no_static_iri_constant's.
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
  string_raw_type(decl)
  some member in members(decl)
  member.type == "EnumCaseDeclSyntax"
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

# On an enum, any static property is a constant hung on the enum.
enum_term_constant(member) if {
  member.type == "VariableDeclSyntax"
  is_static(member)
}

enum_term_constant(member) if term_function(member)

# `case animal = "Animal"`
enum_term_constant(member) if {
  member.type == "EnumCaseDeclSyntax"
  some elements in member.children
  elements.type == "EnumCaseElementListSyntax"
  some element in elements.children
  some raw in element.children
  raw.type == "InitializerClauseSyntax"
  some value in raw.children
  value.type == "StringLiteralExprSyntax"
}

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
  term_value(form)
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

term_value(value) if value.type == "StringLiteralExprSyntax"

term_value(value) if {
  value.type == "FunctionCallExprSyntax"
  callee_name(value.children[0]) in term_kinds
}

is_static(decl) if {
  some modifiers in decl.children
  modifiers.type == "DeclModifierListSyntax"
  some modifier in modifiers.children
  modifier.children[0].token.text in {"static", "class"}
}

# `enum X: String`, `enum X: Swift.String, Sendable`
string_raw_type(decl) if {
  some clause in decl.children
  clause.type == "InheritanceClauseSyntax"
  some list in clause.children
  list.type == "InheritedTypeListSyntax"
  some inherited in list.children
  type_name(inherited.children[0]) == "String"
}

type_name(type) := type.children[0].token.text if type.type == "IdentifierTypeSyntax"

type_name(type) := name.token.text if {
  type.type == "MemberTypeSyntax"
  some name in type.children
  name.type == "TokenSyntax"
  name.token.kind == "identifier"
}

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
