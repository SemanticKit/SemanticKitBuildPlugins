package apple.hig.patterns.progress_indicator
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "ProgressView"
  count([argument |
    some argument in call.arguments
    expression := number_literal(argument.expression)
  ]) == 0
  count([argument |
    some argument in call.arguments
    literal := argument.expression.stringLiteralExpr
  ]) == 0

  warning := {
    "rule_id": "apple.hig.patterns.review_indeterminate_progress_indicator",
    "message": "Review indeterminate progress indicator; set expectations for long-running work.",
    "line": call.range.start.line,
    "column": call.range.start.column,
    "severity": "warning",
  }
]

# A number written as a literal: `44`, `0.5`.
number_literal(expression) := expression.integerLiteralExpr

number_literal(expression) := expression.floatLiteralExpr
