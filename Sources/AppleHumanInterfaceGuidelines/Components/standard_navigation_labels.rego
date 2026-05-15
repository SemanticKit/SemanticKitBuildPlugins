package apple.hig.components.standard_navigation_labels

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
  warning := standard_navigation_label_warning[_]
]

standard_navigation_label_warning contains {
  "rule_id": "apple.hig.components.review_text_navigation_label",
  "message": "Review text navigation label; prefer standard Back or Close controls and symbols.",
  "artifact": input.sourceFile,
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  walk(input.swiftSyntax, [_, call])
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  navigation_text_call_names[callee.children[0].token.text]

  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  argument := argument_list.children[_]
  literal := argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  navigation_label_texts[segment.children[0].token.text]
}

navigation_text_call_names := {"Button", "Text", "Label", "Link"}
navigation_label_texts := {"Back", "Close"}
