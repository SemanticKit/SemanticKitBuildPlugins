package apple.hig.accessibility.symbol_accessibility

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := symbol_accessibility_warning[_]
]

symbol_accessibility_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.accessibility.review_symbol_accessibility_label", "Review symbol image accessibility; provide alternative text for custom interface icons and symbols.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  symbol_image_call(call)
}

symbol_image_call(call) if {
  image_call(call)
  has_argument_label(call, "systemName")
}

image_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "Image")
}

image_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "Image")
}

has_argument_label(call, label) if {
  data.apple.hig.swift_syntax.argument_label(call, label)
}
