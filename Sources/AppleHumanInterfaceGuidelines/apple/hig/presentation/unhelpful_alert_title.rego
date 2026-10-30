package apple.hig.presentation.unhelpful_alert_title

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := unhelpful_alert_title_warning[_]
]

alert_title_surface_names := {"Alert", "Text", "Label", "Button"}

unhelpful_alert_title_warning contains {
  "rule_id": "apple.hig.presentation.review_unhelpful_alert_title",
  "message": "Review alert title; use direct, neutral, specific copy instead of generic error text.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  alert_title_surface_names[callee.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  title := segment.content
  title == "Error"
}
