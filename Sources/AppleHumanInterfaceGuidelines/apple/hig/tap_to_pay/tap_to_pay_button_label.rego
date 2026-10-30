package apple.hig.tap_to_pay.tap_to_pay_button_label
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := tap_to_pay_button_label_warning[_]
]

allowed_tap_to_pay_button_labels := {
  "Tap to Pay",
  "Tap to Pay on iPhone",
}

tap_to_pay_button_label_warning contains {
  "rule_id": "apple.hig.tap_to_pay.review_button_label",
  "message": "Review Tap to Pay button label string literal; Apple HIG button labels are \"Tap to Pay on iPhone\" or \"Tap to Pay\".",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "Button"
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  label := segment.content
  contains(lower(label), "tap to pay")
  not allowed_tap_to_pay_button_labels[label]
}

tap_to_pay_button_label_warning contains {
  "rule_id": "apple.hig.tap_to_pay.review_button_label",
  "message": "Review Tap to Pay button label string literal; Apple HIG button labels are \"Tap to Pay on iPhone\" or \"Tap to Pay\".",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "Button"
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  label := segment.content
  contains(lower(label), "tap-to-pay")
  not allowed_tap_to_pay_button_labels[label]
}
