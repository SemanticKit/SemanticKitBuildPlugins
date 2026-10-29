package apple.hig.nfc.nfc_terms
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := nfc_term_warning[_]
]

visible_string_call_names := {"Text", "Button", "Label", "TextField", "Alert", "help"}

technical_nfc_terms := {
  "nfc",
  "near-field communication",
  "near field communication",
}

contact_instruction_terms := {
  "tap",
  "touch",
}

nfc_term_warning contains {
  "rule_id": "apple.hig.nfc.review_user_instruction_terms",
  "message": "Review visible NFC instruction copy; prefer scan or hold near and avoid technical or contact terms.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  # `name(...)` or the modifier form `base.name(...)`
  reference := {callee, callee.children[count(callee.children) - 1]}[_]
  reference.type == "DeclReferenceExprSyntax"
  visible_string_call_names[reference.children[0].token.text]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  argument := segment.children[0].token.text
  normalized_argument := lower(argument)
  has_technical_nfc_term(normalized_argument)
}

nfc_term_warning contains {
  "rule_id": "apple.hig.nfc.review_user_instruction_terms",
  "message": "Review visible NFC instruction copy; prefer scan or hold near and avoid technical or contact terms.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  # `name(...)` or the modifier form `base.name(...)`
  reference := {callee, callee.children[count(callee.children) - 1]}[_]
  reference.type == "DeclReferenceExprSyntax"
  visible_string_call_names[reference.children[0].token.text]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  argument := segment.children[0].token.text
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
