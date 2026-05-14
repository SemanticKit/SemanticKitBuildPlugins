package apple.hig.patterns.tooltip_copy

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := tooltip_copy_warning[_]
]

tooltip_copy_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.patterns.review_tooltip_copy", "Review tooltip copy; describe the control directly and keep help text around 60 to 75 characters.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  help_call(call)
  has_long_string_argument(call)
}

help_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "help")
}

help_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "help")
}

has_long_string_argument(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  count(argument) > 75
}
