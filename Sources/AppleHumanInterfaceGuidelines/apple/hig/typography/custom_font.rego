package apple.hig.typography.custom_font
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_font_warning[_]
]

custom_font_warning contains {
  "rule_id": "apple.hig.typography.review_custom_font",
  "message": "Review custom font; prefer system fonts and verify legibility.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "custom"
}

custom_font_warning contains {
  "rule_id": "apple.hig.typography.review_custom_font",
  "message": "Review custom font; prefer system fonts and verify legibility.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  member := call.calledExpression.memberAccessExpr.declName
  member.baseName == "custom"
}
