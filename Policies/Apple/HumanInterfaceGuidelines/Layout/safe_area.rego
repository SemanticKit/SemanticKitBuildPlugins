package apple.hig.layout.safe_area

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := safe_area_warning[_]
]

safe_area_warning contains {
  "rule_id": "apple.hig.layout.review_safe_area_opt_out",
  "message": "Review this visible safe-area opt-out against Apple HIG layout guidance: respect safe areas, margins, and guides.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.safeAreaOptOutFacts[_]
}
