package apple.hig.components.help_button

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
  warning := custom_help_button_warning[_]
]

custom_help_button_warning contains data.swift.syntax.warning(call, "apple.hig.components.review_custom_help_button", "Review custom Help button; use the system help button for help documentation where appropriate.") if {
  call := data.swift.syntax.function_calls[_]
  help_text_call(call)
  has_help_text(call)
}

help_text_call_names := {"Button", "Text", "Label", "Link"}

help_text_call(call) if {
  data.swift.syntax.call_named_in(call, help_text_call_names)
}

help_text_call(call) if {
  data.swift.syntax.call_named_in(call, help_text_call_names)
}

has_help_text(call) if {
  data.swift.syntax.string_argument(call, "Help")
}
