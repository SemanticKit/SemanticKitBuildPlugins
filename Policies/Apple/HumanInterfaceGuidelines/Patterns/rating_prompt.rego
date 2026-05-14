package apple.hig.patterns.rating_prompt

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_rating_prompt_warning[_]
]

custom_rating_prompt_warning contains {
  "rule_id": "apple.hig.patterns.review_custom_rating_prompt",
  "message": "Review custom rating prompt; prefer the system rating prompt and ask only after engagement.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  custom_rating_surface_call(fact)
  has_visible_rating_string_argument(fact)
  not system_rating_prompt_call(fact)
}

custom_rating_surface_names := {"Button", "Text", "Label", "Link"}
system_rating_prompt_names := {"RequestReviewAction", "requestReview", "SKStoreReviewController", "requestReviewInCurrentScene"}

custom_rating_surface_call(fact) if {
  custom_rating_surface_names[fact.baseName]
}

custom_rating_surface_call(fact) if {
  custom_rating_surface_names[fact.memberName]
}

system_rating_prompt_call(fact) if {
  system_rating_prompt_names[fact.baseName]
}

system_rating_prompt_call(fact) if {
  system_rating_prompt_names[fact.memberName]
}

has_visible_rating_string_argument(fact) if {
  argument := fact.stringArguments[_]
  indexof(argument, "Rate") >= 0
}

has_visible_rating_string_argument(fact) if {
  argument := fact.stringArguments[_]
  indexof(argument, "Review") >= 0
}
