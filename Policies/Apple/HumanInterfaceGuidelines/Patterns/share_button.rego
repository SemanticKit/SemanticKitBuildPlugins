package apple.hig.patterns.share_button

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_share_button_warning[_]
]

custom_share_button_warning contains {
  "rule_id": "apple.hig.patterns.review_custom_share_button",
  "message": "Review custom Share control; prefer ShareLink or the system share sheet where available.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  custom_share_surface_call(fact)
  has_visible_share_string_argument(fact)
  not sharelink_call(fact)
}

custom_share_surface_names := {"Button", "Text", "Label", "Link"}

custom_share_surface_call(fact) if {
  custom_share_surface_names[fact.baseName]
}

custom_share_surface_call(fact) if {
  custom_share_surface_names[fact.memberName]
}

sharelink_call(fact) if {
  fact.baseName == "ShareLink"
}

sharelink_call(fact) if {
  fact.memberName == "ShareLink"
}

has_visible_share_string_argument(fact) if {
  argument := fact.stringArguments[_]
  argument == "Share"
}

has_visible_share_string_argument(fact) if {
  argument := fact.stringArguments[_]
  indexof(argument, "Share ") >= 0
}

has_visible_share_string_argument(fact) if {
  argument := fact.stringArguments[_]
  indexof(argument, " share") >= 0
}
