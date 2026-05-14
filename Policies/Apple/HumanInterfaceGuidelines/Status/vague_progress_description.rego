package apple.hig.status.vague_progress_description

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := vague_progress_description_warning[_]
]

vague_progress_description_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.status.review_vague_progress_description", "Review progress description; use accurate, succinct text instead of vague status copy.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  progress_view_call(call)
  vague_progress_description(call)
}

vague_progress_terms := {"loading", "loading...", "please wait", "working", "authenticating"}

progress_view_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "ProgressView")
}

progress_view_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "ProgressView")
}

vague_progress_description(call) if {
  description := data.apple.hig.swift_syntax.string_literals(call)[_]
  vague_progress_terms[lower(description)]
}
