# METADATA
# scope: package
# entrypoint: true
package apple.hig.in_app_purchase.refund_labels
default decision := {"deny": [], "warn": [], "note": []}

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
  call := input
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "Button"

  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  argument := argument_list.children[_]
  literal := argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  label := segment.children[0].token.text
  normalized_label := lower(label)
  contains(normalized_label, "refund")
  not accepted_refund_labels[normalized_label]
}
