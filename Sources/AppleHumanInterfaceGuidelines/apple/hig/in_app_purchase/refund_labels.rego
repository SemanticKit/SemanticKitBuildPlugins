package apple.hig.in_app_purchase.refund_labels
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := refund_label_warning[_]
]

accepted_refund_labels := {"refund", "request a refund"}

refund_label_warning contains {
  "rule_id": "apple.hig.in_app_purchase.review_refund_action_label",
  "message": "Review refund action label; use simple labels such as Refund or Request a Refund.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "Button"

  some argument in call.arguments
  literal := argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  label := segment.content
  normalized_label := lower(label)
  contains(normalized_label, "refund")
  not accepted_refund_labels[normalized_label]
}
