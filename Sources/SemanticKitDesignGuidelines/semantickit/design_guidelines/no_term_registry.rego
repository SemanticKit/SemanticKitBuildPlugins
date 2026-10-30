package semantickit.design_guidelines.no_term_registry

# A registry, or a dictionary keyed by IRI or String, looks terms up by name
# instead of by type. Every IRI- or String-keyed dictionary in a runtime target
# is denied, whatever it holds: a name is not an identity inside the runtime,
# and boundary targets, where names are read, do not depend on this library.
# DESIGN-CONTRACT.md rule 2 (Charles): "The type is the identity. ... Types
# never communicate through IRI strings." RDFKit DslInvariants: no registries.

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

message := "Do not look terms up in a registry or a dictionary keyed by IRI or String; a term is its type, and code refers to it by type."

# `[IRI: Term]`, `[Swift.String: Term]`
denial_set contains finding(node) if {
  node := input
  node.type == "DictionaryTypeSyntax"
  name_key_type(node.children[1])
}

# `Dictionary<IRI, Term>`
denial_set contains finding(node) if {
  node := input
  node.type == "IdentifierTypeSyntax"
  node.children[0].token.text == "Dictionary"
  name_key_type(first_generic_argument(node))
}

# `Swift.Dictionary<IRIKit.IRI, Term>`
denial_set contains finding(node) if {
  node := input
  node.type == "MemberTypeSyntax"
  some name in node.children
  name.type == "TokenSyntax"
  name.token.text == "Dictionary"
  name_key_type(first_generic_argument(node))
}

# `[IRI: Term]()`, `[IRI: Term].init()`, `Dictionary<IRI, Term>()`,
# `Swift.Dictionary<String, Term>.init()`
denial_set contains finding(node) if {
  node := input
  node.type == "FunctionCallExprSyntax"
  some dictionary in dictionary_expressions(node.children[0])
  name_keyed_expression(dictionary)
}

# The dictionary a call builds: the callee, or the base of its `.init`.
dictionary_expressions(callee) := {callee} | {base |
  callee.type == "MemberAccessExprSyntax"
  callee.children[count(callee.children) - 1].children[0].token.text == "init"
  base := callee.children[0]
}

name_keyed_expression(dictionary) if {
  dictionary.type == "DictionaryExprSyntax"
  some elements in dictionary.children
  elements.type == "DictionaryElementListSyntax"
  key := elements.children[0].children[0]
  name_key_expression(key)
}

name_keyed_expression(specialization) if {
  specialization.type == "GenericSpecializationExprSyntax"
  callee := specialization.children[0]
  reference_name(callee) == "Dictionary"
  name_key_type(first_generic_argument(specialization))
}

first_generic_argument(node) := argument if {
  some clause in node.children
  clause.type == "GenericArgumentClauseSyntax"
  some list in clause.children
  list.type == "GenericArgumentListSyntax"
  argument := list.children[0].children[0]
}

# `IRI`, `String`, `IRIKit.IRI`, `Swift.String`
name_key_type(type) if {
  type.type == "IdentifierTypeSyntax"
  type.children[0].token.text in name_keys
}

name_key_type(type) if {
  type.type == "MemberTypeSyntax"
  some name in type.children
  name.type == "TokenSyntax"
  name.token.kind == "identifier"
  name.token.text in name_keys
}

name_key_expression(key) if reference_name(key) in name_keys

reference_name(reference) := reference.children[0].token.text if reference.type == "DeclReferenceExprSyntax"

reference_name(reference) := reference.children[count(reference.children) - 1].children[0].token.text if {
  reference.type == "MemberAccessExprSyntax"
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
