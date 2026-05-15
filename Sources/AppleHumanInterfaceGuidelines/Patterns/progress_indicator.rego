package apple.hig.patterns.progress_indicator

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
  warning := indeterminate_progress_indicator_warning[_]
]

indeterminate_progress_indicator_warning contains data.swift.syntax.warning(call, "apple.hig.patterns.review_indeterminate_progress_indicator", "Review indeterminate progress indicator; set expectations for long-running work.") if {
  call := data.swift.syntax.function_calls[_]
  progress_view_call(call)
  not data.swift.syntax.has_numeric_argument(call)
  not data.swift.syntax.has_string_argument(call)
}

progress_view_call(call) if {
  data.swift.syntax.call_named(call, "ProgressView")
}

progress_view_call(call) if {
  data.swift.syntax.call_named(call, "ProgressView")
}
