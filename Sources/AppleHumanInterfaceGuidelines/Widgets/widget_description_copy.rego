package apple.hig.widgets.widget_description_copy

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
  warning := widget_description_lead_in_warning[_]
]

widget_description_lead_in_warning contains data.swift.syntax.warning(call, "apple.hig.widgets.review_widget_description_lead_in", "Review widget description lead-in; start with an action verb instead of boilerplate widget copy.") if {
  call := data.swift.syntax.function_calls[_]
  widget_description_call(call)
  has_discouraged_widget_description_lead_in(call)
}

discouraged_widget_description_lead_ins := {"this widget shows", "use this widget to", "add this widget"}

widget_description_call(call) if {
  data.swift.syntax.call_named(call, "description")
}

widget_description_call(call) if {
  data.swift.syntax.call_named(call, "description")
}

has_discouraged_widget_description_lead_in(call) if {
  string := data.swift.syntax.string_literals(call)[_]
  description := lower(string)
  lead_in := discouraged_widget_description_lead_ins[_]
  startswith(description, lead_in)
}
