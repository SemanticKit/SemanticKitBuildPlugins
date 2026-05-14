package apple.hig.siri.hey_siri_phrase

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := hey_siri_phrase_warning[_]
]

hey_siri_phrase_warning contains {
  "rule_id": "apple.hig.siri.review_hey_siri_phrase",
  "message": "Review suggested Siri phrase; do not commandeer core Siri commands or include Hey Siri.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  app_shortcut_call(fact)
  has_phrases_argument(fact)
  has_reserved_siri_phrase(fact)
}

app_shortcut_call(fact) if {
  fact.baseName == "AppShortcut"
}

app_shortcut_call(fact) if {
  fact.memberName == "AppShortcut"
}

has_phrases_argument(fact) if {
  fact.argumentLabels[_] == "phrases"
}

has_reserved_siri_phrase(fact) if {
  phrase := fact.stringArguments[_]
  contains(lower(phrase), "hey siri")
}
