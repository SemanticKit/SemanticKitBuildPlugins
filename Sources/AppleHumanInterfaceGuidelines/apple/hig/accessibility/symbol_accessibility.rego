package apple.hig.accessibility.symbol_accessibility
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := symbol_accessibility_warning[_]
]

symbol_accessibility_warning contains {
  "rule_id": "apple.hig.accessibility.review_symbol_accessibility_label",
  "message": "Review symbol image accessibility; provide alternative text for custom interface icons and symbols.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "Image"

  some argument in call.arguments
  argument.label == "systemName"
}
