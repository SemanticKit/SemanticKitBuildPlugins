package apple.hig.presentation.unhelpful_alert_title

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := unhelpful_alert_title_warning[_]
]

alert_title_surface_names := {"Alert", "Text", "Label", "Button"}

unhelpful_alert_title_warning contains {
  "rule_id": "apple.hig.presentation.review_unhelpful_alert_title",
  "message": "Review alert title; use direct, neutral, specific copy instead of generic error text.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  alert_title_surface_names[callee.children[0].token.text]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  title := segment.children[0].token.text
  title == "Error"
}
