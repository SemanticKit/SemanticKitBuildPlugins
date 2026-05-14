package apple.hig.typography.custom_font

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_font_warning[_]
]

custom_font_warning contains {
  "rule_id": "apple.hig.typography.review_custom_font",
  "message": "Review custom font; prefer system fonts and verify legibility.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  custom_font_call(fact)
}

custom_font_call(fact) if {
  fact.baseName == "custom"
}

custom_font_call(fact) if {
  fact.memberName == "custom"
}
