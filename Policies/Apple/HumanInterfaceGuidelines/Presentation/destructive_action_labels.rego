package apple.hig.presentation.destructive_action_labels

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := destructive_action_label_warning[_]
]

destructive_action_label_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.presentation.review_destructive_action_label", "Review destructive action; use destructive styling and provide a clear cancel path.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  visible_action_call(call)
  has_destructive_action_label(call)
}

visible_action_call_names := {"Button", "Link"}
destructive_action_label_prefixes := ["Delete", "Remove", "Discard", "Erase", "Reset"]

visible_action_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, visible_action_call_names)
}

visible_action_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, visible_action_call_names)
}

has_destructive_action_label(call) if {
  label := data.apple.hig.swift_syntax.string_literals(call)[_]
  prefix := destructive_action_label_prefixes[_]
  startswith(label, prefix)
}
