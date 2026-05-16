package apple.hig.presentation.window_sizing

# Policy metadata
# scope: package
# entrypoint: true
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := window_sizing_warning[_]
]

window_sizing_call_names := {"defaultSize", "windowResizability"}

window_sizing_warning contains {
  "rule_id": "apple.hig.presentation.review_window_sizing_constraints",
  "message": "Review explicit window sizing; confirm the initial size fits content and resizing keeps content usable.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  window_sizing_call_names[callee.children[0].token.text]
}

window_sizing_warning contains {
  "rule_id": "apple.hig.presentation.review_window_sizing_constraints",
  "message": "Review explicit window sizing; confirm the initial size fits content and resizing keeps content usable.",
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
  window_sizing_call_names[member.children[0].token.text]
}
