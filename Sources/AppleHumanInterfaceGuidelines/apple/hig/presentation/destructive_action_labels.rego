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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  visible_action_call_names[callee.children[0].token.text]
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
  prefix := destructive_action_label_prefixes[_]
  startswith(label, prefix)
}
