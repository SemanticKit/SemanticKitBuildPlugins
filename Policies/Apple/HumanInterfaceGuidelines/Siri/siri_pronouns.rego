package apple.hig.siri.siri_pronouns

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := siri_pronoun_copy_warning[_]
]

siri_pronoun_copy_warning contains {
  "rule_id": "apple.hig.siri.review_siri_pronoun_copy",
  "message": "Review Siri copy; refer to Siri by name instead of using pronouns such as she, him, or her.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  visible_string_call(fact)
  has_siri_pronoun_copy(fact)
}

visible_string_call_names := {"Text", "Label", "Button", "TextField", "help"}

visible_string_call(fact) if {
  visible_string_call_names[fact.baseName]
}

visible_string_call(fact) if {
  visible_string_call_names[fact.memberName]
}

siri_pronoun_substrings := {
  " she ",
  " she",
  "she ",
  " her",
  "her ",
  " him",
  "him ",
}

has_siri_pronoun_copy(fact) if {
  value := fact.stringArguments[_]
  normalized := lower(value)
  contains(normalized, "siri")
  pattern := siri_pronoun_substrings[_]
  contains(normalized, pattern)
}
