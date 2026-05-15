package apple.hig.healthkit.healthkit_terms

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
  warning := healthkit_term_warning[_]
]

healthkit_term_warning contains data.swift.syntax.warning(call, "apple.hig.healthkit.review_user_facing_healthkit_term", "Review visible HealthKit terminology; prefer Apple Health or the Apple Health app in user-facing copy.") if {
  call := data.swift.syntax.function_calls[_]
  visible_string_call(call)
  has_healthkit_term(call)
}

visible_string_call_names := {"Text", "Button", "Label", "TextField", "Alert", "help"}

visible_string_call(call) if {
  data.swift.syntax.call_named_in(call, visible_string_call_names)
}

visible_string_call(call) if {
  data.swift.syntax.call_named_in(call, visible_string_call_names)
}

has_healthkit_term(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  contains(lower(argument), "healthkit")
}

has_healthkit_term(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  has_bad_apple_health_capitalization(argument)
}

has_bad_apple_health_capitalization(argument) if {
  segment_without_correct_term := split(argument, "Apple Health")[_]
  has_phrase_with_boundaries(lower(segment_without_correct_term), "apple health")
}

boundary_characters := {
  " ",
  ".",
  ",",
  ":",
  ";",
  "!",
  "?",
  "-",
  "(",
  ")",
  "[",
  "]",
  "{",
  "}",
  "/",
  "\\",
  "'",
  "\"",
}

has_phrase_with_boundaries(text, phrase) if {
  parts := split(text, phrase)
  occurrence_count := count(parts) - 1
  some index
  before := parts[index]
  index < occurrence_count
  next_index := index + 1
  after := parts[next_index]
  boundary_before_phrase(before)
  boundary_after_phrase(after)
}

boundary_before_phrase(before) if {
  before == ""
}

boundary_before_phrase(before) if {
  boundary := boundary_characters[_]
  endswith(before, boundary)
}

boundary_after_phrase(after) if {
  after == ""
}

boundary_after_phrase(after) if {
  boundary := boundary_characters[_]
  startswith(after, boundary)
}
