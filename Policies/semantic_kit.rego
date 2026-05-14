package semantickit.main

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": apple_hig_warnings,
  "note": [],
}

apple_hig_warnings := [warning |
  warning := data.apple.hig.main.decision.warn[_]
]
