package apple.hig.components.button_labels

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := button_label_length_warning[_]
]

button_label_length_warning contains {
  "rule_id": "apple.hig.components.review_button_label_length",
  "message": "Review long button label; keep button text short and clear.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  button_call(fact)
  has_long_label(fact)
}

button_call(fact) if {
  fact.baseName == "Button"
}

button_call(fact) if {
  fact.memberName == "Button"
}

has_long_label(fact) if {
  label := fact.stringArguments[_]
  count(label) > 32
}
