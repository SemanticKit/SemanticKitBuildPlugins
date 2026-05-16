# METADATA
# scope: package
# entrypoint: true
package apple.hig.typography.custom_font
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_font_warning[_]
]

custom_font_warning contains {
  "rule_id": "apple.hig.typography.review_custom_font",
  "message": "Review custom font; prefer system fonts and verify legibility.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "custom"
}

custom_font_warning contains {
  "rule_id": "apple.hig.typography.review_custom_font",
  "message": "Review custom font; prefer system fonts and verify legibility.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[_]
  member.token.text == "custom"
}

custom_font_warning contains {
  "rule_id": "apple.hig.typography.review_custom_font",
  "message": "Review custom font; prefer system fonts and verify legibility.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[_]
  member.children[0].token.text == "custom"
}
