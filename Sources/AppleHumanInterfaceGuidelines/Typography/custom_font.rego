package apple.hig.typography.custom_font

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
  warning := custom_font_warning[_]
]

custom_font_warning contains data.swift.syntax.warning(call, "apple.hig.typography.review_custom_font", "Review custom font; prefer system fonts and verify legibility.") if {
  call := data.swift.syntax.function_calls[_]
  custom_font_call(call)
}

custom_font_call(call) if {
  data.swift.syntax.call_named(call, "custom")
}

custom_font_call(call) if {
  data.swift.syntax.call_named(call, "custom")
}
