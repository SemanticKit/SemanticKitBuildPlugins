package semantickit.design_guidelines.no_dictionary_boundary_plumbing

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
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
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  texts := token_texts(call)
  not texts["decode"]
  dictionary_plumbing(texts)
}

# The text of every token in the call, read in one walk of its subtree.
token_texts(call) := {text |
  walk(call, [_, node])
  is_object(node)
  text := node.token.text
  is_string(text)
}

dictionary_plumbing(texts) if {
  some name in texts
  dictionary_call_names[name]
}

dictionary_plumbing(texts) if {
  some text in texts
  contains(lower(text), "dictionary")
}

dictionary_plumbing(texts) if {
  some text in texts
  dictionary_key_string(text)
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
