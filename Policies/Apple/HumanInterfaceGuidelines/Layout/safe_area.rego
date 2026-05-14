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
  fact := input.swiftSourceFacts.callFacts[_]
  safe_area_opt_out_call(fact)
}

safe_area_opt_out_names := {"ignoresSafeArea", "edgesIgnoringSafeArea"}

safe_area_opt_out_call(fact) if {
  safe_area_opt_out_names[fact.memberName]
}

safe_area_opt_out_call(fact) if {
  safe_area_opt_out_names[fact.baseName]
}
