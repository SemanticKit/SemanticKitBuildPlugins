package apple.hig.healthkit.healthkit_terms
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := healthkit_term_warning[_]
]

healthkit_term_warning contains {
  "rule_id": "apple.hig.healthkit.review_user_facing_healthkit_term",
  "message": "Review visible HealthKit terminology; prefer Apple Health or the Apple Health app in user-facing copy.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  {"Text", "Button", "Label", "TextField", "Alert", "help"}[reference.baseName]

  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content

  contains(lower(argument), "healthkit")
}

healthkit_term_warning contains {
  "rule_id": "apple.hig.healthkit.review_user_facing_healthkit_term",
  "message": "Review visible HealthKit terminology; prefer Apple Health or the Apple Health app in user-facing copy.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  {"Text", "Button", "Label", "TextField", "Alert", "help"}[reference.baseName]

  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content

  segment_without_correct_term := split(argument, "Apple Health")[_]
  text := lower(segment_without_correct_term)
  phrase := "apple health"
  parts := split(text, phrase)
  occurrence_count := count(parts) - 1
  some index
  before := parts[index]
  index < occurrence_count
  next_index := index + 1
  after := parts[next_index]
  {
    before == "",
    endswith(before, " "),
    endswith(before, "."),
    endswith(before, ","),
    endswith(before, ":"),
    endswith(before, ";"),
    endswith(before, "!"),
    endswith(before, "?"),
    endswith(before, "-"),
    endswith(before, "("),
    endswith(before, "["),
    endswith(before, "{"),
    endswith(before, "/"),
    endswith(before, "\\"),
    endswith(before, "'"),
    endswith(before, "\""),
  }[true]
  {
    after == "",
    startswith(after, " "),
    startswith(after, "."),
    startswith(after, ","),
    startswith(after, ":"),
    startswith(after, ";"),
    startswith(after, "!"),
    startswith(after, "?"),
    startswith(after, "-"),
    startswith(after, ")"),
    startswith(after, "]"),
    startswith(after, "}"),
    startswith(after, "/"),
    startswith(after, "\\"),
    startswith(after, "'"),
    startswith(after, "\""),
  }[true]
}

# The name a call calls: `Text` in `Text("…")`, `help` in `.help("…")`.
called_reference(call) := call.calledExpression.declReferenceExpr

called_reference(call) := call.calledExpression.memberAccessExpr.declName
