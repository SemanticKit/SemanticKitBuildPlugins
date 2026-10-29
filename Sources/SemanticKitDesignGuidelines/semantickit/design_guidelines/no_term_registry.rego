package semantickit.design_guidelines.no_term_registry

# A registry, or a dictionary keyed by IRI or String, looks terms up by name
# instead of by type.
# DESIGN-CONTRACT.md rule 2 (Charles): "The type is the identity. ... Types
# never communicate through IRI strings." RDFKit DslInvariants: no registries.

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

message := "Do not look terms up in a registry or a dictionary keyed by IRI or String; a term is its type, and code refers to it by type."

# `[IRI: Term]`, `[String: Term]`
denial_set contains finding(node) if {
  node := input
  node.type == "DictionaryTypeSyntax"
  node.children[1].type == "IdentifierTypeSyntax"
  node.children[1].children[0].token.text in name_keys
}

# `Dictionary<IRI, Term>`
denial_set contains finding(node) if {
  node := input
  node.type == "IdentifierTypeSyntax"
  node.children[0].token.text == "Dictionary"
  some clause in node.children
  clause.type == "GenericArgumentClauseSyntax"
  some list in clause.children
  list.type == "GenericArgumentListSyntax"
  key := list.children[0].children[0]
  key.type == "IdentifierTypeSyntax"
  key.children[0].token.text in name_keys
}

# `[IRI: Term]()`
denial_set contains finding(node) if {
  node := input
  node.type == "FunctionCallExprSyntax"
  node.children[0].type == "DictionaryExprSyntax"
  some elements in node.children[0].children
  elements.type == "DictionaryElementListSyntax"
  key := elements.children[0].children[0]
  key.type == "DeclReferenceExprSyntax"
  key.children[0].token.text in name_keys
}

# `final class TermRegistry`, `struct VocabularyRegistry`. Each body tests one
# node type, so the evaluator gives the policy only the nodes it can match.
denial_set contains finding(node) if {
  node := input
  node.type == "ClassDeclSyntax"
  registry_name(node)
}

denial_set contains finding(node) if {
  node := input
  node.type == "StructDeclSyntax"
  registry_name(node)
}

denial_set contains finding(node) if {
  node := input
  node.type == "EnumDeclSyntax"
  registry_name(node)
}

denial_set contains finding(node) if {
  node := input
  node.type == "ActorDeclSyntax"
  registry_name(node)
}

denial_set contains finding(node) if {
  node := input
  node.type == "ProtocolDeclSyntax"
  registry_name(node)
}

registry_name(decl) if {
  some name in decl.children
  name.token.kind == "identifier"
  endswith(name.token.text, "Registry")
}

finding(node) := {
  "rule_id": "semantickit.design_guidelines.no_term_registry",
  "message": message,
  "line": node.range.start.line,
  "column": node.range.start.column,
  "severity": "error",
}

name_keys := {"IRI", "String"}
