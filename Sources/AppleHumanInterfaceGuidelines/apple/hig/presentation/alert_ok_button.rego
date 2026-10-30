package apple.hig.presentation.alert_ok_button
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := alert_ok_button_warning[_]
]

alert_surface_names := {"Button", "Text", "Label", "Link"}

alert_ok_button_warning contains {
  "rule_id": "apple.hig.presentation.review_alert_ok_button",
  "message": "Review OK button label; use a specific action title when the alert is not purely informational.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  alert_surface_names[callee.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  argument == "OK"
}
