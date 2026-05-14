package apple.hig.components.help_button

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_help_button_warning[_]
]

custom_help_button_warning contains {
  "rule_id": "apple.hig.components.review_custom_help_button",
  "message": "Review custom Help button; use the system help button for help documentation where appropriate.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  help_text_call(fact)
  has_help_text(fact)
}

help_text_call_names := {"Button", "Text", "Label", "Link"}

help_text_call(fact) if {
  help_text_call_names[fact.baseName]
}

help_text_call(fact) if {
  help_text_call_names[fact.memberName]
}

has_help_text(fact) if {
  fact.stringArguments[_] == "Help"
}
