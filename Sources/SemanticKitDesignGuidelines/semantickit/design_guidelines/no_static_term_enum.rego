package semantickit.design_guidelines.no_static_term_enum

# An enum that holds static properties, or cases with string raw values, is a
# static container of terms. A term is declared in the ontology and becomes
# its own type; it is never a constant on an enum.
# DESIGN-CONTRACT.md rule 3 (Charles): "No static mapping onto enums, structs
# and statics." RDFKit DslInvariants: no static enum-style term containers.

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

denial_set contains {
  "rule_id": "semantickit.design_guidelines.no_static_term_enum",
  "message": "Do not keep terms as static constants or string raw values on an enum; declare the term in the ontology so that it is its own type.",
  "line": decl.range.start.line,
  "column": decl.range.start.column,
  "severity": "error",
} if {
  decl := input
  decl.type == "EnumDeclSyntax"
  some member in members(decl)
  term_constant(member)
}

# The declarations directly inside the enum's member block.
members(decl) := [member |
  some block in decl.children
  block.type == "MemberBlockSyntax"
  some list in block.children
  list.type == "MemberBlockItemListSyntax"
  some item in list.children
  member := item.children[0]
]

term_constant(member) if {
  member.type == "VariableDeclSyntax"
  some modifiers in member.children
  modifiers.type == "DeclModifierListSyntax"
  some modifier in modifiers.children
  modifier.children[0].token.text in {"static", "class"}
}

term_constant(member) if {
  member.type == "EnumCaseDeclSyntax"
  some elements in member.children
  elements.type == "EnumCaseElementListSyntax"
  some element in elements.children
  some raw in element.children
  raw.type == "InitializerClauseSyntax"
  some value in raw.children
  value.type == "StringLiteralExprSyntax"
}
