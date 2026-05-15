package apple.hig.sharing.shareplay_term

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
  warning := shareplay_term_warning[_]
]

shareplay_term_warning contains data.swift.syntax.warning(call, "apple.hig.sharing.review_shareplay_term", "Review visible SharePlay terminology; use SharePlay as a noun or direct-action verb without modifying the term.") if {
  call := data.swift.syntax.function_calls[_]
  visible_string_call(call)
  has_modified_shareplay_term(call)
}

visible_string_call_names := {"Text", "Button", "Label"}

visible_string_call(call) if {
  data.swift.syntax.call_named_in(call, visible_string_call_names)
}

visible_string_call(call) if {
  data.swift.syntax.call_named_in(call, visible_string_call_names)
}

modified_shareplay_terms := {
  "shareplaying",
  "shareplayed",
  "shareplays",
  "share-play",
  "share play",
  "shareplay session",
}

has_modified_shareplay_term(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  term := modified_shareplay_terms[_]
  contains(lower(argument), term)
}
