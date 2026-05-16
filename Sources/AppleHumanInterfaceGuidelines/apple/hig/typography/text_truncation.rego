# METADATA
# scope: package
# entrypoint: true
package apple.hig.typography.text_truncation
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := text_truncation_warning[_]
]

text_truncation_call_names := {"lineLimit", "truncationMode"}

text_truncation_warning contains {
  "rule_id": "apple.hig.typography.review_text_truncation",
  "message": "Review text truncation; prefer readable truncation such as centered ellipsis where appropriate.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  text_truncation_call_names[callee.children[0].token.text]
}

text_truncation_warning contains {
  "rule_id": "apple.hig.typography.review_text_truncation",
  "message": "Review text truncation; prefer readable truncation such as centered ellipsis where appropriate.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[_]
  text_truncation_call_names[member.token.text]
}

text_truncation_warning contains {
  "rule_id": "apple.hig.typography.review_text_truncation",
  "message": "Review text truncation; prefer readable truncation such as centered ellipsis where appropriate.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[_]
  text_truncation_call_names[member.children[0].token.text]
}
