package apple.hig.patterns.share_button
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_share_button_warning[_]
]

custom_share_surface_names := {"Button", "Text", "Label", "Link"}

custom_share_button_warning contains {
  "rule_id": "apple.hig.patterns.review_custom_share_button",
  "message": "Review custom Share control; prefer ShareLink or the system share sheet where available.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee_name := callee.children[0].token.text
  custom_share_surface_names[callee_name]
  callee_name != "ShareLink"
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
  {argument == "Share", indexof(argument, "Share ") >= 0, indexof(argument, " share") >= 0}[true]
}
