package apple.hig.augmented_reality.technical_ar_terms

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := technical_ar_terms_warning[_]
]

technical_ar_terms_warning contains {
  "rule_id": "apple.hig.augmented_reality.review_technical_ar_terms",
  "message": "Review AR instructional text; use approachable terms instead of technical AR terminology.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  visible_instructional_string_call(fact)
  has_technical_ar_term(fact)
}

visible_string_call_names := {"Text", "Label", "Button", "TextField", "help"}
technical_ar_terms := {"arkit", "world detection", "tracking"}

visible_instructional_string_call(fact) if {
  visible_string_call_names[fact.baseName]
}

visible_instructional_string_call(fact) if {
  visible_string_call_names[fact.memberName]
}

has_technical_ar_term(fact) if {
  argument := fact.stringArguments[_]
  term := technical_ar_terms[_]
  contains(lower(argument), term)
}
