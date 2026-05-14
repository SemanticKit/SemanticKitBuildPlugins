package apple.hig.siri.hey_siri_phrase

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := hey_siri_phrase_warning[_]
]

hey_siri_phrase_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.siri.review_hey_siri_phrase", "Review suggested Siri phrase; do not commandeer core Siri commands or include Hey Siri.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  app_shortcut_call(call)
  has_phrases_argument(call)
  has_reserved_siri_phrase(call)
}

app_shortcut_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "AppShortcut")
}

app_shortcut_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "AppShortcut")
}

has_phrases_argument(call) if {
  data.apple.hig.swift_syntax.argument_label(call, "phrases")
}

has_reserved_siri_phrase(call) if {
  phrase := data.apple.hig.swift_syntax.string_literals(call)[_]
  contains(lower(phrase), "hey siri")
}
