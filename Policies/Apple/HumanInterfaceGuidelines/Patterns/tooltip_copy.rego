package apple.hig.patterns.tooltip_copy

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := tooltip_copy_warning[_]
]

tooltip_copy_warning contains {
  "rule_id": "apple.hig.patterns.review_tooltip_copy",
  "message": "Review tooltip copy; describe the control directly and keep help text around 60 to 75 characters.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  help_call(fact)
  has_long_string_argument(fact)
}

help_call(fact) if {
  fact.baseName == "help"
}

help_call(fact) if {
  fact.memberName == "help"
}

has_long_string_argument(fact) if {
  argument := fact.stringArguments[_]
  count(argument) > 75
}
