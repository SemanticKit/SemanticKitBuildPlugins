package semantickit.design_guidelines.no_mode_flag_helper

# Turning text into a term, or a term into text, is behaviour of the term
# type and of the format's own coder type: never a free or private helper
# that takes a `Bool` mode. Denied: a function named `decode…`, `encode…` or
# `parse…` that takes a `Bool` (or `Swift.Bool`) parameter and is either
# free (declared as a statement, not as a member of a type or extension) or
# `private`/`fileprivate`,
# as in `private func decodeTerm(_ token: String, tsvMode: Bool)`.
# DESIGN-CONTRACT.md rule 15 (Charles): "Turning text into a term is an
# initializer on the term type, or its `Decodable` conformance, used by the
# format's decoder. It is not a free or private helper on a parser. A format
# is its own coder type, never a `Bool` mode flag."

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

finding(function) := {
  "rule_id": "semantickit.design_guidelines.no_mode_flag_helper",
  "message": "Do not decode, encode or parse through a free or private helper with a Bool mode flag; make it an initializer or Decodable conformance on the term type, and make each format its own coder type.",
  "line": function.range.start.line,
  "column": function.range.start.column,
  "severity": "error",
}

# A private or fileprivate helper, wherever it is declared.
denial_set contains finding(function) if {
  function := input
  function.type == "FunctionDeclSyntax"
  flagged_coding_helper(function)
  restricted(function)
}

# A free function: one declared as a statement, at the top level of a file
# or inside a function body, rather than as a member of a type or extension
# (members are `MemberBlockItemSyntax`, statements `CodeBlockItemSyntax`).
denial_set contains finding(function) if {
  item := input
  item.type == "CodeBlockItemSyntax"
  some function in item.children
  function.type == "FunctionDeclSyntax"
  flagged_coding_helper(function)
}

flagged_coding_helper(function) if {
  function.type == "FunctionDeclSyntax"
  regex.match(`^(decode|encode|parse)([A-Z_].*)?$`, function_name(function))
  some signature in function.children
  signature.type == "FunctionSignatureSyntax"
  some clause in signature.children
  clause.type == "FunctionParameterClauseSyntax"
  some parameters in clause.children
  parameters.type == "FunctionParameterListSyntax"
  some parameter in parameters.children
  some type in parameter.children
  bool_type(type)
}

function_name(function) := names[0] if {
  names := [token.token.text | some token in function.children; token.type == "TokenSyntax"; token.token.kind == "identifier"]
}

bool_type(type) if {
  type.type == "IdentifierTypeSyntax"
  type.children[0].token.text == "Bool"
}

# `Swift.Bool`
bool_type(type) if {
  type.type == "MemberTypeSyntax"
  type.children[count(type.children) - 1].token.text == "Bool"
}

restricted(function) if {
  some modifiers in function.children
  modifiers.type == "DeclModifierListSyntax"
  some modifier in modifiers.children
  modifier.children[0].token.text in {"private", "fileprivate"}
}
