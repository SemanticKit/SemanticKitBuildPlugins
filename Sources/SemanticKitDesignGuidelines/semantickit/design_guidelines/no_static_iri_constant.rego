package semantickit.design_guidelines.no_static_iri_constant

# A static property typed IRI, or set to an IRI, is a term held as an IRI
# constant (`Foaf.agentClass`, `ACL.readClass`). Inside the runtime the type is
# the identity; an IRI is read only at the boundary.
# DESIGN-CONTRACT.md rule 2 (Charles): "Types never communicate through IRI
# strings. IRIs exist only at the boundary." Rule 3: "No static mapping onto
# enums, structs and statics."

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

denial_set contains {
  "rule_id": "semantickit.design_guidelines.no_static_iri_constant",
  "message": "Do not hold a term as a static IRI constant; the term's type is its identity, and its IRI is read only at the boundary.",
  "line": decl.range.start.line,
  "column": decl.range.start.column,
  "severity": "error",
} if {
  decl := input
  decl.type == "VariableDeclSyntax"
  is_static(decl)
  some bindings in decl.children
  bindings.type == "PatternBindingListSyntax"
  some binding in bindings.children
  iri_binding(binding)
}

is_static(decl) if {
  some modifiers in decl.children
  modifiers.type == "DeclModifierListSyntax"
  some modifier in modifiers.children
  modifier.children[0].token.text in {"static", "class"}
}

# `static let knows: IRI`
iri_binding(binding) if {
  some annotation in binding.children
  annotation.type == "TypeAnnotationSyntax"
  some type in annotation.children
  type.type == "IdentifierTypeSyntax"
  type.children[0].token.text == "IRI"
}

# `static let knows = IRI("…")`
iri_binding(binding) if {
  some initializer in binding.children
  initializer.type == "InitializerClauseSyntax"
  some call in initializer.children
  call.type == "FunctionCallExprSyntax"
  call.children[0].type == "DeclReferenceExprSyntax"
  call.children[0].children[0].token.text == "IRI"
}
