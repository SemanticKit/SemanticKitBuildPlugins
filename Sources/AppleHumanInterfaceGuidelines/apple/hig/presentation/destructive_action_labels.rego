package apple.hig.presentation.destructive_action_labels
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := destructive_action_label_warning[_]
]

visible_action_call_names := {"Button", "Link"}
destructive_action_label_prefixes := ["Delete", "Remove", "Discard", "Erase", "Reset"]

destructive_action_label_warning contains {
  "rule_id": "apple.hig.presentation.review_destructive_action_label",
  "message": "Review destructive action; use destructive styling and provide a clear cancel path.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  visible_action_call_names[callee.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  label := segment.content
  prefix := destructive_action_label_prefixes[_]
  startswith(label, prefix)
}
