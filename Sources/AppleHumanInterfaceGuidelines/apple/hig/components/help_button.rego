package apple.hig.components.help_button
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_help_button_warning[_]
]

custom_help_button_warning contains {
  "rule_id": "apple.hig.components.review_custom_help_button",
  "message": "Review custom Help button; use the system help button for help documentation where appropriate.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  help_text_call_names[callee.children[0].token.text]

  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  argument := argument_list.children[_]
  literal := argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  segment.children[0].token.text == "Help"
}

help_text_call_names := {"Button", "Text", "Label", "Link"}
