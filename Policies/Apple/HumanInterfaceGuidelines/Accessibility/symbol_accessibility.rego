package apple.hig.accessibility.symbol_accessibility

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := symbol_accessibility_warning[_]
]

symbol_accessibility_warning contains {
  "rule_id": "apple.hig.accessibility.review_symbol_accessibility_label",
  "message": "Review symbol image accessibility; provide alternative text for custom interface icons and symbols.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  symbol_image_call(fact)
}

symbol_image_call(fact) if {
  image_call(fact)
  has_argument_label(fact, "systemName")
}

image_call(fact) if {
  fact.baseName == "Image"
}

image_call(fact) if {
  fact.memberName == "Image"
}

has_argument_label(fact, label) if {
  fact.argumentLabels[_] == label
}
