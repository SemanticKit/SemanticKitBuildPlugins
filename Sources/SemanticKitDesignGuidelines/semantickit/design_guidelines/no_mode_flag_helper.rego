package semantickit.design_guidelines.no_mode_flag_helper

# Turning text into a term, or a term into text, is behaviour of the term
# type and of the format's own coder type: never a free or private helper
# that takes a `Bool` mode. Denied: a function named `decode…`, `encode…` or
# `parse…` that takes a `Bool` (or `Swift.Bool`) parameter and is either
# free (declared as a statement, not as a member of a type or extension: the
# innermost declaration around it is not a type or an extension) or
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
  some function in input.functionDecls
  flagged_coding_helper(function)
  restricted(function)
}

# A free function: one declared at the top level of a file or inside a
# function body, rather than as a member of a type or extension.
denial_set contains finding(function) if {
  some function in input.functionDecls
  flagged_coding_helper(function)
  not member(function)
}

# The innermost declaration around the function is a type or an extension.
member(function) if {
  type_or_extension(function.context[count(function.context) - 1])
}

type_or_extension(declaration) if declaration.structDecl

type_or_extension(declaration) if declaration.classDecl

type_or_extension(declaration) if declaration.enumDecl

type_or_extension(declaration) if declaration.actorDecl

type_or_extension(declaration) if declaration.protocolDecl

type_or_extension(declaration) if declaration.extensionDecl

flagged_coding_helper(function) if {
  regex.match(`^(decode|encode|parse)([A-Z_].*)?$`, function.name)
  some parameter in function.signature.parameterClause.parameters
  bool_type(parameter.type)
}

# `Bool`, `Swift.Bool`
bool_type(type) if type.identifierType.name == "Bool"

bool_type(type) if type.memberType.name == "Bool"

restricted(function) if {
  some modifier in function.modifiers
  modifier.name in {"private", "fileprivate"}
}
