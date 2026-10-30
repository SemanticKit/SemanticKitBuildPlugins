package apple.hig.layout.safe_area
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
  callee_name := reference.baseName
  {"ignoresSafeArea", "edgesIgnoringSafeArea"}[callee_name]

  warning := {
    "rule_id": "apple.hig.layout.review_safe_area_opt_out",
    "message": "Review this visible safe-area opt-out against Apple HIG layout guidance: respect safe areas, margins, and guides.",
    "line": call.range.start.line,
    "column": call.range.start.column,
    "severity": "warning",
  }
]

# The name a call calls: `Text` in `Text("…")`, `help` in `.help("…")`.
called_reference(call) := call.calledExpression.declReferenceExpr

called_reference(call) := call.calledExpression.memberAccessExpr.declName
