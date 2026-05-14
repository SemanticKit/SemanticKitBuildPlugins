package apple.hig.platform_services.airplay_custom_controls

custom_airplay_control_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.platform_services.review_airplay_term_as_noun", "Review visible AirPlay string literal; use AirPlay as a noun and avoid modifying the term.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  airplay_term_noun_visible_string_call(call)
  has_modified_airplay_term(call)
}

airplay_term_noun_visible_string_call_names := {"Text", "Button", "Label", "Link", "TextField", "Alert", "help"}

airplay_term_noun_visible_string_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, airplay_term_noun_visible_string_call_names)
}

airplay_term_noun_visible_string_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, airplay_term_noun_visible_string_call_names)
}

modified_airplay_terms := {
  "airplaying",
  "airplayed",
  "airplays",
  "airplayable",
}

has_modified_airplay_term(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  term := modified_airplay_terms[_]
  contains(lower(argument), term)
}
