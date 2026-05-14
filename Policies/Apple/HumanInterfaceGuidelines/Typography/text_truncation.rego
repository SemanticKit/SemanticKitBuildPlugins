package apple.hig.typography.text_truncation

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := text_truncation_warning[_]
]

text_truncation_warning contains {
  "rule_id": "apple.hig.typography.review_text_truncation",
  "message": "Review text truncation; prefer readable truncation such as centered ellipsis where appropriate.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  text_truncation_call(fact)
}

text_truncation_call_names := {"lineLimit", "truncationMode"}

text_truncation_call(fact) if {
  text_truncation_call_names[fact.baseName]
}

text_truncation_call(fact) if {
  text_truncation_call_names[fact.memberName]
}
