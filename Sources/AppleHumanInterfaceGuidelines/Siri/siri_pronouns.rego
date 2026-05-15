package apple.hig.siri.siri_pronouns

# METADATA
# scope: document
# entrypoint: true
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := siri_pronoun_copy_warning[_]
]

siri_pronoun_copy_warning contains data.swift.syntax.warning(call, "apple.hig.siri.review_siri_pronoun_copy", "Review Siri copy; refer to Siri by name instead of using pronouns such as she, him, or her.") if {
  call := data.swift.syntax.function_calls[_]
  visible_string_call(call)
  has_siri_pronoun_copy(call)
}

visible_string_call_names := {"Text", "Label", "Button", "TextField", "help"}

visible_string_call(call) if {
  data.swift.syntax.call_named_in(call, visible_string_call_names)
}

visible_string_call(call) if {
  data.swift.syntax.call_named_in(call, visible_string_call_names)
}

siri_pronoun_substrings := {
  " she ",
  " she",
  "she ",
  " her",
  "her ",
  " him",
  "him ",
}

has_siri_pronoun_copy(call) if {
  value := data.swift.syntax.string_literals(call)[_]
  normalized := lower(value)
  contains(normalized, "siri")
  pattern := siri_pronoun_substrings[_]
  contains(normalized, pattern)
}
