package apple.hig.presentation.destructive_action_labels

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := destructive_action_label_warning[_]
]

destructive_action_label_warning contains {
  "rule_id": "apple.hig.presentation.review_destructive_action_label",
  "message": "Review destructive action; use destructive styling and provide a clear cancel path.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  visible_action_call(fact)
  has_destructive_action_label(fact)
}

visible_action_call_names := {"Button", "Link"}
destructive_action_label_prefixes := ["Delete", "Remove", "Discard", "Erase", "Reset"]

visible_action_call(fact) if {
  visible_action_call_names[fact.baseName]
}

visible_action_call(fact) if {
  visible_action_call_names[fact.memberName]
}

has_destructive_action_label(fact) if {
  label := fact.stringArguments[_]
  prefix := destructive_action_label_prefixes[_]
  startswith(label, prefix)
}
