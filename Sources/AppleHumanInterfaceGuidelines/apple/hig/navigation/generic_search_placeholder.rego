package apple.hig.navigation.generic_search_placeholder
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := generic_search_placeholder_warning[_]
]

search_field_call_names := {"TextField", "SearchField", "NSSearchField"}

generic_search_placeholder_warning contains {
  "rule_id": "apple.hig.navigation.review_generic_search_placeholder",
  "message": "Review search field placeholder; describe what people can search for instead of using generic Search text.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  search_field_call_names[reference.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  placeholder := segment.content
  placeholder == "Search"
}

generic_search_placeholder_warning contains {
  "rule_id": "apple.hig.navigation.review_generic_search_placeholder",
  "message": "Review search field placeholder; describe what people can search for instead of using generic Search text.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  reference.baseName == "searchable"
  some labeled_argument in call.arguments
  labeled_argument.label == "prompt"
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  placeholder := segment.content
  placeholder == "Search"
}

# The name a call calls: `Text` in `Text("…")`, `help` in `.help("…")`.
called_reference(call) := call.calledExpression.declReferenceExpr

called_reference(call) := call.calledExpression.memberAccessExpr.declName
