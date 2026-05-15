package apple.hig.components.standard_navigation_labels

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
  warning := standard_navigation_label_warning[_]
]

standard_navigation_label_warning contains data.swift.syntax.warning(call, "apple.hig.components.review_text_navigation_label", "Review text navigation label; prefer standard Back or Close controls and symbols.") if {
  call := data.swift.syntax.function_calls[_]
  navigation_text_call(call)
  has_navigation_label_text(call)
}

navigation_text_call_names := {"Button", "Text", "Label", "Link"}
navigation_label_texts := {"Back", "Close"}

navigation_text_call(call) if {
  data.swift.syntax.call_named_in(call, navigation_text_call_names)
}

navigation_text_call(call) if {
  data.swift.syntax.call_named_in(call, navigation_text_call_names)
}

has_navigation_label_text(call) if {
  text := data.swift.syntax.string_literals(call)[_]
  navigation_label_texts[text]
}
