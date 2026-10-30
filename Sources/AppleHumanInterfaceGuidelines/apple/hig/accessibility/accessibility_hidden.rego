package apple.hig.accessibility.accessibility_hidden
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := accessibility_hidden_warning[_]
]

accessibility_hidden_warning contains {
  "rule_id": "apple.hig.accessibility.review_accessibility_hidden",
  "message": "Review accessibilityHidden use; hide visible content from assistive technologies only when it adds no value.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  member := call.calledExpression.memberAccessExpr.declName
    member.baseName == "accessibilityHidden"
}
