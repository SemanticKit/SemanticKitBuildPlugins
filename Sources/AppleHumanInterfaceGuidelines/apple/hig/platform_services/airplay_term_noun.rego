package apple.hig.platform_services.airplay_term_noun
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := airplay_term_noun_warning[_]
]

airplay_term_noun_visible_string_call_names := {"Text", "Button", "Label", "Link", "TextField", "Alert", "help"}

modified_airplay_terms := {
  "airplaying",
  "airplayed",
  "airplays",
  "airplayable",
}

airplay_term_noun_warning contains {
  "rule_id": "apple.hig.platform_services.review_airplay_term_as_noun",
  "message": "Review visible AirPlay string literal; use AirPlay as a noun and avoid modifying the term.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  airplay_term_noun_visible_string_call_names[reference.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  term := modified_airplay_terms[_]
  contains(lower(argument), term)
}

# The name a call calls: `Text` in `Text("…")`, `help` in `.help("…")`.
called_reference(call) := call.calledExpression.declReferenceExpr

called_reference(call) := call.calledExpression.memberAccessExpr.declName
