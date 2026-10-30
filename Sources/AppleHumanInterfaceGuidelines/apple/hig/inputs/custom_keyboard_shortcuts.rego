package apple.hig.inputs.custom_keyboard_shortcuts
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  some call in input.functionCallExprs

  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  reference.baseName == "keyboardShortcut"

  warning := {
    "rule_id": "apple.hig.inputs.review_custom_keyboard_shortcut",
    "message": "Review custom keyboard shortcut; prefer standard shortcuts and define custom shortcuts only when necessary.",
    "line": call.range.start.line,
    "column": call.range.start.column,
    "severity": "warning",
  }
]

# The name a call calls: `Text` in `Text("…")`, `help` in `.help("…")`.
called_reference(call) := call.calledExpression.declReferenceExpr

called_reference(call) := call.calledExpression.memberAccessExpr.declName
