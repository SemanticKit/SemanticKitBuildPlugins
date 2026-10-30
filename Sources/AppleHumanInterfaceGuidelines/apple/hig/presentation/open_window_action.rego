package apple.hig.presentation.open_window_action

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := open_window_action_warning[_]
]

open_window_action_warning contains {
  "rule_id": "apple.hig.presentation.review_open_window_action",
  "message": "Review openWindow/OpenWindowAction usage; confirm new-window commands are deliberate.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  reference.baseName == "openWindow"
}

# The name a call calls: `Text` in `Text("…")`, `help` in `.help("…")`.
called_reference(call) := call.calledExpression.declReferenceExpr

called_reference(call) := call.calledExpression.memberAccessExpr.declName
