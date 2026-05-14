package semantickit.design_guidelines.main

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
  data.semantickit.design_guidelines.no_dictionary_boundary_plumbing.decision.warn,
]
