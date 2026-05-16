# METADATA
# scope: package
# entrypoint: true
package apple.hig.accessibility.accessibility_hidden
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := accessibility_hidden_warning[_]
]

accessibility_hidden_warning contains {
  "rule_id": "apple.hig.accessibility.review_accessibility_hidden",
  "message": "Review accessibilityHidden use; hide visible content from assistive technologies only when it adds no value.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[count(callee.children) - 1]
  member.type == "DeclReferenceExprSyntax"
  token := member.children[0].token
  token.text == "accessibilityHidden"
}
