package apple.hig.patterns.progress_indicator

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := indeterminate_progress_indicator_warning[_]
]

indeterminate_progress_indicator_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.patterns.review_indeterminate_progress_indicator", "Review indeterminate progress indicator; set expectations for long-running work.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  progress_view_call(call)
  not data.apple.hig.swift_syntax.has_numeric_argument(call)
  not data.apple.hig.swift_syntax.has_string_argument(call)
}

progress_view_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "ProgressView")
}

progress_view_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "ProgressView")
}
