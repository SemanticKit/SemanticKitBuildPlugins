package semantickit.design_guidelines.no_mode_flag_helper

# Turning text into a term, or a term into text, is behaviour of the term
# type and of the format's own coder type, never selected by a `Bool` mode.
# Denied: any function or method named `decode…`, `encode…` or `parse…` that
# takes a `Bool` parameter (`Bool`, `Swift.Bool`, `Bool?`, `Bool!`,
# `inout Bool`), wherever it is declared and whatever its access: free,
# private, internal or public, a member of a parser or of a coder type, as in
# `private func decodeTerm(_ token: String, tsvMode: Bool)` and
# `public struct TurtleDecoder { public func decode(_ text: String, strict: Bool) }`.
# Each format, and each variant of one, is its own coder type.
# Not reported: the `Bool` that is the value being coded, the one unlabeled
# parameter beside at most a `forKey:` key, as the Encoder containers of
# SE-0166/0167 declare it: `encode(_ value: Bool)`, `encode(_ value: Bool,
# forKey key: Key)`, `encodeIfPresent(_ value: Bool?)` (DESIGN-CONTRACT.md
# rule 13 makes those containers the shape of a format coder).
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
  "message": "Do not decode, encode or parse with a Bool mode flag; make it an initializer or Decodable conformance on the term type, and make each format its own coder type.",
  "line": function.range.start.line,
  "column": function.range.start.column,
  "severity": "error",
}

denial_set contains finding(function) if {
  some function in input.functionDecls
  flagged_coding_helper(function)
}

flagged_coding_helper(function) if {
  regex.match(`^(decode|encode|parse)([A-Z_].*)?$`, function.name)
  some parameter in function.signature.parameterClause.parameters
  bool_type(parameter.type)
  not coded_value(function, parameter)
}

# `encode(_ value: Bool)`, `encode(_ value: Bool, forKey key: Key)`: the Bool
# is the value, unlabeled, and every other parameter is the `forKey:` key.
coded_value(function, parameter) if {
  parameter.firstName == "_"
  every other in function.signature.parameterClause.parameters {
    key_or_value(other, parameter)
  }
}

key_or_value(other, parameter) if other == parameter

key_or_value(other, _) if other.firstName == "forKey"

# `Bool`, `Swift.Bool`, `Bool?`, `Bool!`, `inout Bool`
bool_type(type) if {
  some form in type_forms(type)
  named_bool(form)
}

named_bool(type) if type.identifierType.name == "Bool"

named_bool(type) if type.memberType.name == "Bool"

# The type, and what `?`, `!` and `inout` wrap, two levels deep.
type_forms(type) := {type} | wrapped(type) | {deeper | some form in wrapped(type); some deeper in wrapped(form)}

wrapped(type) := ({child | child := type.optionalType.wrappedType} | {child | child := type.implicitlyUnwrappedOptionalType.wrappedType}) | {child | child := type.attributedType.baseType}
