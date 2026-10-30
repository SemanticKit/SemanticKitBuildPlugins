package apple.hig.widgets.widget_margins
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := content_margins_disabled_warning[_]
]

content_margins_disabled_warning contains {
  "rule_id": "apple.hig.widgets.review_content_margins_disabled",
  "message": "Review disabled widget content margins; use standard widget margins for legibility unless the design needs custom spacing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "contentMarginsDisabled"
}

content_margins_disabled_warning contains {
  "rule_id": "apple.hig.widgets.review_content_margins_disabled",
  "message": "Review disabled widget content margins; use standard widget margins for legibility unless the design needs custom spacing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  member := call.calledExpression.memberAccessExpr.declName
  member.baseName == "contentMarginsDisabled"
}
