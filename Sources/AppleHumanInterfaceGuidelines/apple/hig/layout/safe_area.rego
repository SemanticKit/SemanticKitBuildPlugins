# METADATA
# scope: package
# entrypoint: true
package apple.hig.layout.safe_area
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
  callee_name := callee.children[0].token.text
  {"ignoresSafeArea", "edgesIgnoringSafeArea"}[callee_name]

  warning := {
    "rule_id": "apple.hig.layout.review_safe_area_opt_out",
    "message": "Review this visible safe-area opt-out against Apple HIG layout guidance: respect safe areas, margins, and guides.",
    "line": call.range.start.line,
    "column": call.range.start.column,
    "severity": "warning",
  }
]
