package apple.hig.patterns.tooltip_copy
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := tooltip_copy_warning[_]
]

tooltip_copy_warning contains {
  "rule_id": "apple.hig.patterns.review_tooltip_copy",
  "message": "Review tooltip copy; describe the control directly and keep help text around 60 to 75 characters.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  # `name(...)` or the modifier form `base.name(...)`
  reference := {callee, callee.children[count(callee.children) - 1]}[_]
  reference.type == "DeclReferenceExprSyntax"
  reference.children[0].token.text == "help"
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
  count(argument) > 75
}
