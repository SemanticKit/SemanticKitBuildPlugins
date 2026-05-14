package apple.hig.components.standard_navigation_labels

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := standard_navigation_label_warning[_]
]

standard_navigation_label_warning contains {
  "rule_id": "apple.hig.components.review_text_navigation_label",
  "message": "Review text navigation label; prefer standard Back or Close controls and symbols.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  navigation_text_call(fact)
  has_navigation_label_text(fact)
}

navigation_text_call_names := {"Button", "Text", "Label", "Link"}
navigation_label_texts := {"Back", "Close"}

navigation_text_call(fact) if {
  navigation_text_call_names[fact.baseName]
}

navigation_text_call(fact) if {
  navigation_text_call_names[fact.memberName]
}

has_navigation_label_text(fact) if {
  text := fact.stringArguments[_]
  navigation_label_texts[text]
}
