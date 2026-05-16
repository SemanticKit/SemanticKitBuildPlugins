# METADATA
# scope: package
# entrypoint: true
package apple.hig.widgets.widget_margins
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := content_margins_disabled_warning[_]
]

content_margins_disabled_warning contains {
  "rule_id": "apple.hig.widgets.review_content_margins_disabled",
  "message": "Review disabled widget content margins; use standard widget margins for legibility unless the design needs custom spacing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "contentMarginsDisabled"
}

content_margins_disabled_warning contains {
  "rule_id": "apple.hig.widgets.review_content_margins_disabled",
  "message": "Review disabled widget content margins; use standard widget margins for legibility unless the design needs custom spacing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[_]
  member.token.text == "contentMarginsDisabled"
}

content_margins_disabled_warning contains {
  "rule_id": "apple.hig.widgets.review_content_margins_disabled",
  "message": "Review disabled widget content margins; use standard widget margins for legibility unless the design needs custom spacing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[_]
  member.children[0].token.text == "contentMarginsDisabled"
}
