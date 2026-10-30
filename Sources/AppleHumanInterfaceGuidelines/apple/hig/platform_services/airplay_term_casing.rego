package apple.hig.platform_services.airplay_term_casing
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := airplay_term_casing_warning[_]
]

airplay_term_casing_visible_string_call_names := {"Text", "Button", "Label", "Link", "TextField", "Alert", "help"}

airplay_term_casing_warning contains {
  "rule_id": "apple.hig.platform_services.review_airplay_term_casing",
  "message": "Review visible AirPlay string literal; use the AirPlay term casing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  airplay_term_casing_visible_string_call_names[reference.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  lower_count := count(split(lower(argument), "airplay")) - 1
  correct_count := count(split(argument, "AirPlay")) - 1
  lower_count > correct_count
}

airplay_term_casing_warning contains {
  "rule_id": "apple.hig.platform_services.review_airplay_term_casing",
  "message": "Review visible AirPlay string literal; use the AirPlay term casing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  airplay_term_casing_visible_string_call_names[reference.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  contains(lower(argument), "air play")
}

airplay_term_casing_warning contains {
  "rule_id": "apple.hig.platform_services.review_airplay_term_casing",
  "message": "Review visible AirPlay string literal; use the AirPlay term casing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  airplay_term_casing_visible_string_call_names[reference.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  contains(lower(argument), "air-play")
}

# The name a call calls: `Text` in `Text("…")`, `help` in `.help("…")`.
called_reference(call) := call.calledExpression.declReferenceExpr

called_reference(call) := call.calledExpression.memberAccessExpr.declName
