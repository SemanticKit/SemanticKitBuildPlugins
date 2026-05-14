package apple.hig.accessibility.fixed_font_size

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := fixed_font_size_warning[_]
]

fixed_font_size_warning contains {
  "rule_id": "apple.hig.accessibility.review_fixed_font_size",
  "message": "Review literal SwiftUI system font size use; support larger text sizes.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  swiftui_system_size_call(fact)
}

swiftui_system_size_call(fact) if {
  fact.baseName == "system"
  has_argument_label(fact, "size")
  has_numeric_argument(fact)
}

has_argument_label(fact, label) if {
  fact.argumentLabels[_] == label
}

has_numeric_argument(fact) if {
  count(fact.numericArguments) > 0
}
