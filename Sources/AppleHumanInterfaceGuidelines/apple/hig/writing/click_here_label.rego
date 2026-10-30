package apple.hig.writing.click_here_label
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := click_here_label_warning[_]
]

click_here_label_warning contains {
  "rule_id": "apple.hig.writing.review_click_here_label",
  "message": "Review visible string literal containing Click here; use action-oriented button or link label copy.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  callee := call.calledExpression.declReferenceExpr
  visible_label_call_names[callee.baseName]

  some argument in call.arguments
  literal := argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  contains(lower(segment.content), "click here")
}

visible_label_call_names := {"Button", "Link"}
