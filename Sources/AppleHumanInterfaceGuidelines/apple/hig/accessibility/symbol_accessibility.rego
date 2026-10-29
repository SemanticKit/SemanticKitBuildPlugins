package apple.hig.accessibility.symbol_accessibility
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := symbol_accessibility_warning[_]
]

symbol_accessibility_warning contains {
  "rule_id": "apple.hig.accessibility.review_symbol_accessibility_label",
  "message": "Review symbol image accessibility; provide alternative text for custom interface icons and symbols.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "Image"

  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  argument := argument_list.children[_]
  argument.children[0].token.text == "systemName"
}
