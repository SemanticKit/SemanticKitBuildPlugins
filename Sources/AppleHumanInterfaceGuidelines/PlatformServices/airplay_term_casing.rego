package apple.hig.platform_services.airplay_term_casing

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
  warning := airplay_term_casing_warning[_]
]

airplay_term_casing_warning contains data.swift.syntax.warning(call, "apple.hig.platform_services.review_airplay_term_casing", "Review visible AirPlay string literal; use the AirPlay term casing.") if {
  call := data.swift.syntax.function_calls[_]
  airplay_term_casing_visible_string_call(call)
  has_incorrect_airplay_term_casing(call)
}

airplay_term_casing_visible_string_call_names := {"Text", "Button", "Label", "Link", "TextField", "Alert", "help"}

airplay_term_casing_visible_string_call(call) if {
  data.swift.syntax.call_named_in(call, airplay_term_casing_visible_string_call_names)
}

has_incorrect_airplay_term_casing(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  lower_count := count(split(lower(argument), "airplay")) - 1
  correct_count := count(split(argument, "AirPlay")) - 1
  lower_count > correct_count
}

has_incorrect_airplay_term_casing(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  contains(lower(argument), "air play")
}

has_incorrect_airplay_term_casing(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  contains(lower(argument), "air-play")
}
