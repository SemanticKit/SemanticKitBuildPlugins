package apple.hig.status.vague_progress_description

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := vague_progress_description_warning[_]
]

vague_progress_description_warning contains {
  "rule_id": "apple.hig.status.review_vague_progress_description",
  "message": "Review progress description; use accurate, succinct text instead of vague status copy.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  progress_view_call(fact)
  vague_progress_description(fact)
}

vague_progress_terms := {"loading", "loading...", "please wait", "working", "authenticating"}

progress_view_call(fact) if {
  fact.baseName == "ProgressView"
}

progress_view_call(fact) if {
  fact.memberName == "ProgressView"
}

vague_progress_description(fact) if {
  description := fact.stringArguments[_]
  vague_progress_terms[lower(description)]
}
