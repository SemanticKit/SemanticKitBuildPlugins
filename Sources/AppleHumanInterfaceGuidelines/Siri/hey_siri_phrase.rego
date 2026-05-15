package apple.hig.siri.hey_siri_phrase

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
  warning := hey_siri_phrase_warning[_]
]

hey_siri_phrase_warning contains data.swift.syntax.warning(call, "apple.hig.siri.review_hey_siri_phrase", "Review suggested Siri phrase; do not commandeer core Siri commands or include Hey Siri.") if {
  call := data.swift.syntax.function_calls[_]
  app_shortcut_call(call)
  has_phrases_argument(call)
  has_reserved_siri_phrase(call)
}

app_shortcut_call(call) if {
  data.swift.syntax.call_named(call, "AppShortcut")
}

app_shortcut_call(call) if {
  data.swift.syntax.call_named(call, "AppShortcut")
}

has_phrases_argument(call) if {
  data.swift.syntax.argument_label(call, "phrases")
}

has_reserved_siri_phrase(call) if {
  phrase := data.swift.syntax.string_literals(call)[_]
  contains(lower(phrase), "hey siri")
}
