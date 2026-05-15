package apple.hig.accessibility.fixed_font_size

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
  warning := fixed_font_size_warning[_]
]

fixed_font_size_warning contains data.swift.syntax.warning(call, "apple.hig.accessibility.review_fixed_font_size", "Review literal SwiftUI system font size use; support larger text sizes.") if {
  call := data.swift.syntax.function_calls[_]
  swiftui_system_size_call(call)
}

swiftui_system_size_call(call) if {
  data.swift.syntax.call_named(call, "system")
  has_argument_label(call, "size")
  has_numeric_argument(call)
}

has_argument_label(call, label) if {
  data.swift.syntax.argument_label(call, label)
}

has_numeric_argument(call) if {
  data.swift.syntax.has_numeric_argument(call)
}
