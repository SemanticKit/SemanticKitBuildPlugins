package apple.hig.widgets.widget_description_copy

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := widget_description_lead_in_warning[_]
]

widget_description_lead_in_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.widgets.review_widget_description_lead_in", "Review widget description lead-in; start with an action verb instead of boilerplate widget copy.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  widget_description_call(call)
  has_discouraged_widget_description_lead_in(call)
}

discouraged_widget_description_lead_ins := {"this widget shows", "use this widget to", "add this widget"}

widget_description_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "description")
}

widget_description_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "description")
}

has_discouraged_widget_description_lead_in(call) if {
  string := data.apple.hig.swift_syntax.string_literals(call)[_]
  description := lower(string)
  lead_in := discouraged_widget_description_lead_ins[_]
  startswith(description, lead_in)
}
