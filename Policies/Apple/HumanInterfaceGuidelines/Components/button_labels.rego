package apple.hig.components.button_labels

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := button_label_length_warning[_]
]

button_label_length_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.components.review_button_label_length", "Review long button label; keep button text short and clear.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  button_call(call)
  has_long_label(call)
}

button_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "Button")
}

button_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "Button")
}

has_long_label(call) if {
  label := data.apple.hig.swift_syntax.string_literals(call)[_]
  count(label) > 32
}
