package apple.hig.nfc.nfc_terms

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := nfc_term_warning[_]
]

nfc_term_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.nfc.review_user_instruction_terms", "Review visible NFC instruction copy; prefer scan or hold near and avoid technical or contact terms.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  visible_string_call(call)
  has_discouraged_nfc_instruction_term(call)
}

visible_string_call_names := {"Text", "Button", "Label", "TextField", "Alert", "help"}

visible_string_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, visible_string_call_names)
}

visible_string_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, visible_string_call_names)
}

technical_nfc_terms := {
  "nfc",
  "near-field communication",
  "near field communication",
}

contact_instruction_terms := {
  "tap",
  "touch",
}

has_discouraged_nfc_instruction_term(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  normalized_argument := lower(argument)
  has_technical_nfc_term(normalized_argument)
}

has_discouraged_nfc_instruction_term(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  normalized_argument := lower(argument)
  has_contact_instruction_term(normalized_argument)
  has_nfc_context(normalized_argument)
}

has_technical_nfc_term(normalized_argument) if {
  term := technical_nfc_terms[_]
  has_phrase_with_boundaries(normalized_argument, term)
}

has_contact_instruction_term(normalized_argument) if {
  term := contact_instruction_terms[_]
  has_phrase_with_boundaries(normalized_argument, term)
}

has_nfc_context(normalized_argument) if {
  has_technical_nfc_term(normalized_argument)
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
