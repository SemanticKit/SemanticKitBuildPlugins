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
  some call in input.functionCallExprs
  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  visible_string_call_names[reference.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  value := segment.content
  normalized := lower(value)
  contains(normalized, "siri")
  pattern := siri_pronoun_substrings[_]
  contains(normalized, pattern)
}

# The name a call calls: `Text` in `Text("…")`, `help` in `.help("…")`.
called_reference(call) := call.calledExpression.declReferenceExpr

called_reference(call) := call.calledExpression.memberAccessExpr.declName
