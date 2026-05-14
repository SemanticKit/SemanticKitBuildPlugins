package apple.hig.presentation.alert_ok_button

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := alert_ok_button_warning[_]
]

alert_ok_button_warning contains {
  "rule_id": "apple.hig.presentation.review_alert_ok_button",
  "message": "Review OK button label; use a specific action title when the alert is not purely informational.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  alert_surface_call(fact)
  has_ok_string_argument(fact)
}

alert_surface_names := {"Button", "Text", "Label", "Link"}

alert_surface_call(fact) if {
  alert_surface_names[fact.baseName]
}

alert_surface_call(fact) if {
  alert_surface_names[fact.memberName]
}

has_ok_string_argument(fact) if {
  argument := fact.stringArguments[_]
  argument == "OK"
}
