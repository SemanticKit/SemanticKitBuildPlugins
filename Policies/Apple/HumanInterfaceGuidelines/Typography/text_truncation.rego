package apple.hig.typography.text_truncation

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := text_truncation_warning[_]
]

text_truncation_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.typography.review_text_truncation", "Review text truncation; prefer readable truncation such as centered ellipsis where appropriate.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  text_truncation_call(call)
}

text_truncation_call_names := {"lineLimit", "truncationMode"}

text_truncation_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, text_truncation_call_names)
}

text_truncation_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, text_truncation_call_names)
}
