# METADATA
# scope: package
# entrypoint: true
package apple.hig.inputs.custom_keyboard_shortcuts
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  call := input
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "keyboardShortcut"

  warning := {
    "rule_id": "apple.hig.inputs.review_custom_keyboard_shortcut",
    "message": "Review custom keyboard shortcut; prefer standard shortcuts and define custom shortcuts only when necessary.",
    "line": call.range.start.line,
    "column": call.range.start.column,
    "severity": "warning",
  }
]
