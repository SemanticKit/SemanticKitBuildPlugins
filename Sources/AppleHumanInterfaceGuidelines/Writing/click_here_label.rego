package apple.hig.writing.click_here_label

# METADATA
# scope: document
# entrypoint: true
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := click_here_label_warning[_]
]

click_here_label_warning contains {
  "rule_id": "apple.hig.writing.review_click_here_label",
  "message": "Review visible string literal containing Click here; use action-oriented button or link label copy.",
  "artifact": input.sourceFile,
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  walk(input.swiftSyntax, [_, call])
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  visible_label_call_names[callee.children[0].token.text]

  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  argument := argument_list.children[_]
  literal := argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  contains(lower(segment.children[0].token.text), "click here")
}

visible_label_call_names := {"Button", "Link"}
