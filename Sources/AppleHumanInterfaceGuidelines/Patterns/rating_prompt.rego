package apple.hig.patterns.rating_prompt

# METADATA
# scope: document
# entrypoint: true
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_rating_prompt_warning[_]
]

custom_rating_prompt_warning contains data.swift.syntax.warning(call, "apple.hig.patterns.review_custom_rating_prompt", "Review custom rating prompt; prefer the system rating prompt and ask only after engagement.") if {
  call := data.swift.syntax.function_calls[_]
  custom_rating_surface_call(call)
  has_visible_rating_string_argument(call)
  not system_rating_prompt_call(call)
}

custom_rating_surface_names := {"Button", "Text", "Label", "Link"}
system_rating_prompt_names := {"RequestReviewAction", "requestReview", "SKStoreReviewController", "requestReviewInCurrentScene"}

custom_rating_surface_call(call) if {
  data.swift.syntax.call_named_in(call, custom_rating_surface_names)
}

custom_rating_surface_call(call) if {
  data.swift.syntax.call_named_in(call, custom_rating_surface_names)
}

system_rating_prompt_call(call) if {
  data.swift.syntax.call_named_in(call, system_rating_prompt_names)
}

system_rating_prompt_call(call) if {
  data.swift.syntax.call_named_in(call, system_rating_prompt_names)
}

has_visible_rating_string_argument(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  indexof(argument, "Rate") >= 0
}

has_visible_rating_string_argument(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  indexof(argument, "Review") >= 0
}
