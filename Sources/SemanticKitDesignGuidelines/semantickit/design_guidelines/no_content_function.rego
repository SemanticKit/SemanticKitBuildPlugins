package semantickit.design_guidelines.no_content_function

# An ontology is authored as `var body`, as a SwiftUI view is: never as
# `func content()`. Denied: a `func content()` that returns `Content` (also
# `some Content`, `any Content`, `RDFKit.Content`), and any `func content` of
# a type that is an ontology (`@Ontology`, or conforming to `Ontology`).
# DESIGN-CONTRACT.md rule 14 (Charles): "It was var body, just like Swift UI
# for the same fucking reason." An ontology is authored as `var body`, never
# `func content()`.

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

finding(function) := {
  "rule_id": "semantickit.design_guidelines.no_content_function",
  "message": "Author the ontology as `var body: some Content`, as in SwiftUI; not as `func content()`.",
  "line": function.range.start.line,
  "column": function.range.start.column,
  "severity": "error",
}

# `func content() -> Content`, `func content() -> some Content`
denial_set contains finding(function) if {
  function := input
  function.type == "FunctionDeclSyntax"
  content_function(function)
  some signature in function.children
  signature.type == "FunctionSignatureSyntax"
  some clause in signature.children
  clause.type == "ReturnClauseSyntax"
  some type in clause.children
  content_type(type)
}

# `@Ontology struct Fauna { func content() … }`, `struct Fauna: Ontology { … }`
denial_set contains finding(member) if {
  decl := input
  decl.type == "StructDeclSyntax"
  some member in ontology_content(decl)
}

denial_set contains finding(member) if {
  decl := input
  decl.type == "ClassDeclSyntax"
  some member in ontology_content(decl)
}

denial_set contains finding(member) if {
  decl := input
  decl.type == "EnumDeclSyntax"
  some member in ontology_content(decl)
}

denial_set contains finding(member) if {
  decl := input
  decl.type == "ActorDeclSyntax"
  some member in ontology_content(decl)
}

denial_set contains finding(member) if {
  decl := input
  decl.type == "ExtensionDeclSyntax"
  some member in ontology_content(decl)
}

ontology_content(decl) := {member |
  ontology(decl)
  some block in decl.children
  block.type == "MemberBlockSyntax"
  some list in block.children
  list.type == "MemberBlockItemListSyntax"
  some item in list.children
  member := item.children[0]
  member.type == "FunctionDeclSyntax"
  content_function(member)
}

content_function(function) if {
  some name in function.children
  name.type == "TokenSyntax"
  name.token.kind == "identifier"
  name.token.text == "content"
}

content_type(type) if type_name(type) == "Content"

# `some Content`, `any Content`
content_type(type) if {
  type.type == "SomeOrAnyTypeSyntax"
  some constraint in type.children
  type_name(constraint) == "Content"
}

ontology(decl) if {
  some attributes in decl.children
  attributes.type == "AttributeListSyntax"
  some attribute in attributes.children
  attribute.type == "AttributeSyntax"
  some name in attribute.children
  type_name(name) == "Ontology"
}

ontology(decl) if {
  some clause in decl.children
  clause.type == "InheritanceClauseSyntax"
  some list in clause.children
  list.type == "InheritedTypeListSyntax"
  some inherited in list.children
  type_name(inherited.children[0]) == "Ontology"
}

type_name(type) := type.children[0].token.text if type.type == "IdentifierTypeSyntax"

type_name(type) := name.token.text if {
  type.type == "MemberTypeSyntax"
  some name in type.children
  name.type == "TokenSyntax"
  name.token.kind == "identifier"
}
