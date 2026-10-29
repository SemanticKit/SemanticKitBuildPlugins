package apple.hig.siri.siri_pronouns
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := siri_pronoun_copy_warning[_]
]

visible_string_call_names := {"Text", "Label", "Button", "TextField", "help"}

siri_pronoun_substrings := {
  " she ",
  " she",
  "she ",
  " her",
  "her ",
  " him",
  "him ",
}

siri_pronoun_copy_warning contains {
  "rule_id": "apple.hig.siri.review_siri_pronoun_copy",
  "message": "Review Siri copy; refer to Siri by name instead of using pronouns such as she, him, or her.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  visible_string_call_names[callee.children[0].token.text]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  value := segment.children[0].token.text
  normalized := lower(value)
  contains(normalized, "siri")
  pattern := siri_pronoun_substrings[_]
  contains(normalized, pattern)
}
