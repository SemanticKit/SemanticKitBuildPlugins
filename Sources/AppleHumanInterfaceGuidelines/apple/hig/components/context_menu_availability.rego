package apple.hig.components.context_menu_availability
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
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
  reference.children[0].token.text == "contextMenu"
}
