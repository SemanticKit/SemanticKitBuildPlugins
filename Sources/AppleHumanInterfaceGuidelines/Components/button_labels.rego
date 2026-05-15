package apple.hig.components.button_labels

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
  warning := button_label_length_warning[_]
]

button_label_length_warning contains data.swift.syntax.warning(call, "apple.hig.components.review_button_label_length", "Review long button label; keep button text short and clear.") if {
  call := data.swift.syntax.function_calls[_]
  button_call(call)
  has_long_label(call)
}

button_call(call) if {
  data.swift.syntax.call_named(call, "Button")
}

button_call(call) if {
  data.swift.syntax.call_named(call, "Button")
}

has_long_label(call) if {
  label := data.swift.syntax.string_literals(call)[_]
  count(label) > 32
}
