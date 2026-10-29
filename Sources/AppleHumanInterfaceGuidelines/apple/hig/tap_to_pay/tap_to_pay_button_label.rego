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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "Button"
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  label := segment.children[0].token.text
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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "Button"
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  label := segment.children[0].token.text
  contains(lower(label), "tap-to-pay")
  not allowed_tap_to_pay_button_labels[label]
}
