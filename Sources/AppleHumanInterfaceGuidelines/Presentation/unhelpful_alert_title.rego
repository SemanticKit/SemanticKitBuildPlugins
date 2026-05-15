package apple.hig.presentation.unhelpful_alert_title

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
  warning := unhelpful_alert_title_warning[_]
]

unhelpful_alert_title_warning contains data.swift.syntax.warning(call, "apple.hig.presentation.review_unhelpful_alert_title", "Review alert title; use direct, neutral, specific copy instead of generic error text.") if {
  call := data.swift.syntax.function_calls[_]
  alert_title_surface_call(call)
  has_unhelpful_alert_title(call)
}

alert_title_surface_names := {"Alert", "Text", "Label", "Button"}

alert_title_surface_call(call) if {
  data.swift.syntax.call_named_in(call, alert_title_surface_names)
}

alert_title_surface_call(call) if {
  data.swift.syntax.call_named_in(call, alert_title_surface_names)
}

has_unhelpful_alert_title(call) if {
  title := data.swift.syntax.string_literals(call)[_]
  title == "Error"
}
