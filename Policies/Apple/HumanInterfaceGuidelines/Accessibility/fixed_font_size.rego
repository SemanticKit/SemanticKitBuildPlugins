package apple.hig.accessibility.fixed_font_size

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := fixed_font_size_warning[_]
]

fixed_font_size_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.accessibility.review_fixed_font_size", "Review literal SwiftUI system font size use; support larger text sizes.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  swiftui_system_size_call(call)
}

swiftui_system_size_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "system")
  has_argument_label(call, "size")
  has_numeric_argument(call)
}

has_argument_label(call, label) if {
  data.apple.hig.swift_syntax.argument_label(call, label)
}

has_numeric_argument(call) if {
  data.apple.hig.swift_syntax.has_numeric_argument(call)
}
