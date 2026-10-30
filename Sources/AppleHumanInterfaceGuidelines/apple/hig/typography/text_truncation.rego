package apple.hig.typography.text_truncation
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := text_truncation_warning[_]
]

text_truncation_call_names := {"lineLimit", "truncationMode"}

text_truncation_warning contains {
  "rule_id": "apple.hig.typography.review_text_truncation",
  "message": "Review text truncation; prefer readable truncation such as centered ellipsis where appropriate.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  text_truncation_call_names[callee.baseName]
}

text_truncation_warning contains {
  "rule_id": "apple.hig.typography.review_text_truncation",
  "message": "Review text truncation; prefer readable truncation such as centered ellipsis where appropriate.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  member := call.calledExpression.memberAccessExpr.declName
  text_truncation_call_names[member.baseName]
}
