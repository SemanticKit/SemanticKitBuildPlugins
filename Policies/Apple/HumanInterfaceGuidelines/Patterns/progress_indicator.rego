package apple.hig.patterns.progress_indicator

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := indeterminate_progress_indicator_warning[_]
]

indeterminate_progress_indicator_warning contains {
  "rule_id": "apple.hig.patterns.review_indeterminate_progress_indicator",
  "message": "Review indeterminate progress indicator; set expectations for long-running work.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  progress_view_call(fact)
  count(fact.numericArguments) == 0
  count(fact.stringArguments) == 0
}

progress_view_call(fact) if {
  fact.baseName == "ProgressView"
}

progress_view_call(fact) if {
  fact.memberName == "ProgressView"
}
