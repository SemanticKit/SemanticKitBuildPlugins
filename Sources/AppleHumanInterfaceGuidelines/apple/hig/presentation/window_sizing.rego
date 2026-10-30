package apple.hig.presentation.window_sizing

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
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
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  window_sizing_call_names[callee.baseName]
}

window_sizing_warning contains {
  "rule_id": "apple.hig.presentation.review_window_sizing_constraints",
  "message": "Review explicit window sizing; confirm the initial size fits content and resizing keeps content usable.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  member := call.calledExpression.memberAccessExpr.declName
  window_sizing_call_names[member.baseName]
}
