package apple.hig.writing.click_here_label

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
  warning := click_here_label_warning[_]
]

click_here_label_warning contains data.swift.syntax.warning(call, "apple.hig.writing.review_click_here_label", "Review visible string literal containing Click here; use action-oriented button or link label copy.") if {
  call := data.swift.syntax.function_calls[_]
  visible_label_call(call)
  has_click_here_string(call)
}

visible_label_call_names := {"Button", "Link"}

visible_label_call(call) if {
  data.swift.syntax.call_named_in(call, visible_label_call_names)
}

visible_label_call(call) if {
  data.swift.syntax.call_named_in(call, visible_label_call_names)
}

has_click_here_string(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  contains(lower(argument), "click here")
}
