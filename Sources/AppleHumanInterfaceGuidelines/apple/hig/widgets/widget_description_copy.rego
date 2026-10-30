package apple.hig.widgets.widget_description_copy
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := widget_description_lead_in_warning[_]
]

discouraged_widget_description_lead_ins := {"this widget shows", "use this widget to", "add this widget"}

widget_description_lead_in_warning contains {
  "rule_id": "apple.hig.widgets.review_widget_description_lead_in",
  "message": "Review widget description lead-in; start with an action verb instead of boilerplate widget copy.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "description"
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  string := segment.content
  description := lower(string)
  lead_in := discouraged_widget_description_lead_ins[_]
  startswith(description, lead_in)
}

widget_description_lead_in_warning contains {
  "rule_id": "apple.hig.widgets.review_widget_description_lead_in",
  "message": "Review widget description lead-in; start with an action verb instead of boilerplate widget copy.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  member := call.calledExpression.memberAccessExpr.declName
  member.baseName == "description"
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  string := segment.content
  description := lower(string)
  lead_in := discouraged_widget_description_lead_ins[_]
  startswith(description, lead_in)
}
