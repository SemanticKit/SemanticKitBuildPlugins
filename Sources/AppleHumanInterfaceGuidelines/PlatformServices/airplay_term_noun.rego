package apple.hig.platform_services.airplay_term_noun

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
  warning := airplay_term_noun_warning[_]
]

airplay_term_noun_warning contains data.swift.syntax.warning(call, "apple.hig.platform_services.review_airplay_term_as_noun", "Review visible AirPlay string literal; use AirPlay as a noun and avoid modifying the term.") if {
  call := data.swift.syntax.function_calls[_]
  airplay_term_noun_visible_string_call(call)
  has_modified_airplay_term(call)
}

airplay_term_noun_visible_string_call_names := {"Text", "Button", "Label", "Link", "TextField", "Alert", "help"}

airplay_term_noun_visible_string_call(call) if {
  data.swift.syntax.call_named_in(call, airplay_term_noun_visible_string_call_names)
}

modified_airplay_terms := {
  "airplaying",
  "airplayed",
  "airplays",
  "airplayable",
}

has_modified_airplay_term(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  term := modified_airplay_terms[_]
  contains(lower(argument), term)
}
