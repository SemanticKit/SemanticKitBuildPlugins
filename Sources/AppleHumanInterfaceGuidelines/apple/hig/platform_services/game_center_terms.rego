package apple.hig.platform_services.game_center_terms
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := game_center_term_warning[_]
]

visible_string_call_names := {"Text", "Button", "Label", "Link", "TextField", "Alert", "help"}

game_center_term_warning contains {
  "rule_id": "apple.hig.platform_services.review_game_center_term_casing",
  "message": "Review visible Game Center string literal; use the Game Center term casing in custom UI.",
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
  argument := segment.content
  lower_count := count(split(lower(argument), "game center")) - 1
  correct_count := count(split(argument, "Game Center")) - 1
  lower_count > correct_count
}

game_center_term_warning contains {
  "rule_id": "apple.hig.platform_services.review_game_center_term_casing",
  "message": "Review visible Game Center string literal; use the Game Center term casing in custom UI.",
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
  argument := segment.content
  contains(lower(argument), "gamecenter")
}

# The name a call calls: `Text` in `Text("…")`, `help` in `.help("…")`.
called_reference(call) := call.calledExpression.declReferenceExpr

called_reference(call) := call.calledExpression.memberAccessExpr.declName
