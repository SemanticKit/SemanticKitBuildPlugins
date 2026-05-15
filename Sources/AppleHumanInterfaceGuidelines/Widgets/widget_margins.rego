package apple.hig.widgets.widget_margins

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
  warning := content_margins_disabled_warning[_]
]

content_margins_disabled_warning contains data.swift.syntax.warning(call, "apple.hig.widgets.review_content_margins_disabled", "Review disabled widget content margins; use standard widget margins for legibility unless the design needs custom spacing.") if {
  call := data.swift.syntax.function_calls[_]
  content_margins_disabled_call(call)
}

content_margins_disabled_call(call) if {
  data.swift.syntax.call_named(call, "contentMarginsDisabled")
}

content_margins_disabled_call(call) if {
  data.swift.syntax.call_named(call, "contentMarginsDisabled")
}
