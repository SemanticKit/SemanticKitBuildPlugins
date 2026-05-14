package semantickit.design_guidelines.no_dictionary_boundary_plumbing

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := dictionary_boundary_warning[_]
]

dictionary_boundary_warning contains {
  "rule_id": "semantickit.design_guidelines.no_dictionary_boundary_plumbing",
  "message": "Decode dictionary-shaped data at the boundary into typed models; do not let generic dictionary plumbing become implementation behavior.",
  "artifact": input.sourceFile,
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  input.swiftSyntax != null
  walk(input.swiftSyntax, [_, call])
  is_object(call)
  call.type == "FunctionCallExprSyntax"
  not explicit_boundary_decode_call(call)
  dictionary_plumbing_call(call)
}

dictionary_plumbing_call(call) if {
  walk(call, [_, node])
  is_object(node)
  name := node.token.text
  is_string(name)
  dictionary_call_name(name)
}

dictionary_plumbing_call(call) if {
  walk(call, [_, node])
  is_object(node)
  text := node.token.text
  is_string(text)
  contains(lower(text), "dictionary")
}

dictionary_plumbing_call(call) if {
  walk(call, [_, node])
  is_object(node)
  text := node.token.text
  is_string(text)
  dictionary_key_string(text)
}

dictionary_call_name(name) if {
  dictionary_call_names[name]
}

dictionary_call_names := {
  "Dictionary",
  "dictionary",
  "mapValues",
  "compactMapValues",
  "merge",
  "merging",
}

dictionary_key_string(value) if {
  contains(value, "_")
}

dictionary_key_string(value) if {
  lower(value) == value
  contains(value, "id")
}

dictionary_key_string(value) if {
  lower(value) == value
  contains(value, "message")
}

explicit_boundary_decode_call(call) if {
  walk(call, [_, node])
  is_object(node)
  node.token.text == "decode"
}
