package apple.hig.presentation.unhelpful_alert_title

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := unhelpful_alert_title_warning[_]
]

unhelpful_alert_title_warning contains {
  "rule_id": "apple.hig.presentation.review_unhelpful_alert_title",
  "message": "Review alert title; use direct, neutral, specific copy instead of generic error text.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  alert_title_surface_call(fact)
  has_unhelpful_alert_title(fact)
}

alert_title_surface_names := {"Alert", "Text", "Label", "Button"}

alert_title_surface_call(fact) if {
  alert_title_surface_names[fact.baseName]
}

alert_title_surface_call(fact) if {
  alert_title_surface_names[fact.memberName]
}

has_unhelpful_alert_title(fact) if {
  title := fact.stringArguments[_]
  title == "Error"
}
