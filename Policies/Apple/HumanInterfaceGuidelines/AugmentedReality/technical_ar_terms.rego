package apple.hig.augmented_reality.technical_ar_terms

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := technical_ar_terms_warning[_]
]

technical_ar_terms_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.augmented_reality.review_technical_ar_terms", "Review AR instructional text; use approachable terms instead of technical AR terminology.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  visible_instructional_string_call(call)
  has_technical_ar_term(call)
}

visible_string_call_names := {"Text", "Label", "Button", "TextField", "help"}
technical_ar_terms := {"arkit", "world detection", "tracking"}

visible_instructional_string_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, visible_string_call_names)
}

visible_instructional_string_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, visible_string_call_names)
}

has_technical_ar_term(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  term := technical_ar_terms[_]
  contains(lower(argument), term)
}
