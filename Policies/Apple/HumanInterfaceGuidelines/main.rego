package apple.hig.main

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := data.apple.hig.layout.safe_area.decision.warn[_]
]
