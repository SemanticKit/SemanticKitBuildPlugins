package apple.hig.accessibility.accessibility_hidden

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := accessibility_hidden_warning[_]
]

accessibility_hidden_warning contains {
  "rule_id": "apple.hig.accessibility.review_accessibility_hidden",
  "message": "Review accessibilityHidden use; hide visible content from assistive technologies only when it adds no value.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  accessibility_hidden_call(fact)
}

accessibility_hidden_call(fact) if {
  fact.baseName == "accessibilityHidden"
}

accessibility_hidden_call(fact) if {
  fact.memberName == "accessibilityHidden"
}
