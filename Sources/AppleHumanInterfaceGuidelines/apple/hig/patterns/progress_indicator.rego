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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "ProgressView"
  count([argument |
    argument_list := call.children[_]
    argument_list.type == "LabeledExprListSyntax"
    argument := argument_list.children[_]
    expression := argument.children[_]
    {"IntegerLiteralExprSyntax", "FloatLiteralExprSyntax"}[expression.type]
  ]) == 0
  count([argument |
    argument_list := call.children[_]
    argument_list.type == "LabeledExprListSyntax"
    argument := argument_list.children[_]
    literal := argument.children[_]
    literal.type == "StringLiteralExprSyntax"
  ]) == 0

  warning := {
    "rule_id": "apple.hig.patterns.review_indeterminate_progress_indicator",
    "message": "Review indeterminate progress indicator; set expectations for long-running work.",
    "line": call.range.start.line,
    "column": call.range.start.column,
    "severity": "warning",
  }
]
