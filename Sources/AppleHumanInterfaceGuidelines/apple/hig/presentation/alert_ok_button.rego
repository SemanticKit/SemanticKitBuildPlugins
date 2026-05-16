# METADATA
# scope: package
# entrypoint: true
package apple.hig.presentation.alert_ok_button
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := alert_ok_button_warning[_]
]

alert_surface_names := {"Button", "Text", "Label", "Link"}

alert_ok_button_warning contains {
  "rule_id": "apple.hig.presentation.review_alert_ok_button",
  "message": "Review OK button label; use a specific action title when the alert is not purely informational.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  alert_surface_names[callee.children[0].token.text]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  argument := segment.children[0].token.text
  argument == "OK"
}
