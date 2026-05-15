package apple.hig.presentation.alert_ok_button

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
  warning := alert_ok_button_warning[_]
]

alert_ok_button_warning contains data.swift.syntax.warning(call, "apple.hig.presentation.review_alert_ok_button", "Review OK button label; use a specific action title when the alert is not purely informational.") if {
  call := data.swift.syntax.function_calls[_]
  alert_surface_call(call)
  has_ok_string_argument(call)
}

alert_surface_names := {"Button", "Text", "Label", "Link"}

alert_surface_call(call) if {
  data.swift.syntax.call_named_in(call, alert_surface_names)
}

alert_surface_call(call) if {
  data.swift.syntax.call_named_in(call, alert_surface_names)
}

has_ok_string_argument(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  argument == "OK"
}
