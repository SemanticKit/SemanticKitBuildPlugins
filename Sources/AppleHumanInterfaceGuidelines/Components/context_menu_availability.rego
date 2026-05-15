package apple.hig.components.context_menu_availability

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
  warning := context_menu_availability_warning[_]
]

context_menu_availability_warning contains {
  "rule_id": "apple.hig.components.review_context_menu_availability",
  "message": "Review context-menu usage and confirm commands are also available from the main interface or menu bar.",
  "artifact": input.sourceFile,
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  walk(input.swiftSyntax, [_, call])
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[count(callee.children) - 1]
  member.type == "DeclReferenceExprSyntax"
  member.children[0].token.text == "contextMenu"
}
