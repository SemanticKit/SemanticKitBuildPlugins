package semantickit.main

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  group := warning_groups[_]
  warning := group[_]
]

warning_groups := [
  data.apple.hig.main.decision.warn,
  data.semantickit.design_guidelines.main.decision.warn,
]

apple_hig_warnings := [warning |
  warning := data.apple.hig.main.decision.warn[_]
]
