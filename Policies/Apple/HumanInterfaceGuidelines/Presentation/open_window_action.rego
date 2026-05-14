package apple.hig.presentation.open_window_action

default decision := {"deny": [], "warn": [], "note": []}

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
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  open_window_call_fact(fact)
}

open_window_call_fact(fact) if {
  fact.baseName == "openWindow"
}

open_window_call_fact(fact) if {
  fact.memberName == "openWindow"
}
