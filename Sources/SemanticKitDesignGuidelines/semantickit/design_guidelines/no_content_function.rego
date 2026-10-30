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
  some function in input.functionDecls
  function.name == "content"
  content_type(function.signature.returnClause.type)
}

# `@Ontology struct Fauna { func content() … }`, `struct Fauna: Ontology { … }`
denial_set contains finding(member.functionDecl) if {
  some decl in groups
  ontology(decl)
  some item in decl.memberBlock.members
  member := item.decl
  member.functionDecl.name == "content"
}

# The structs, classes, enums, actors and extensions of the file.
groups contains decl if some decl in input.structDecls

groups contains decl if some decl in input.classDecls

groups contains decl if some decl in input.enumDecls

groups contains decl if some decl in input.actorDecls

groups contains decl if some decl in input.extensionDecls

content_type(type) if type_name(type) == "Content"

# `some Content`, `any Content`
content_type(type) if type_name(type.someOrAnyType.constraint) == "Content"

ontology(decl) if {
  some attribute in decl.attributes
  type_name(attribute.attributeName) == "Ontology"
}

ontology(decl) if {
  some inherited in decl.inheritanceClause.inheritedTypes
  type_name(inherited.type) == "Ontology"
}

# `Content`, `RDFKit.Content`
type_name(type) := type.identifierType.name

type_name(type) := type.memberType.name
