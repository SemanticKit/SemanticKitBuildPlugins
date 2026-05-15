package apple.hig.platform_services.game_center_terms

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
  warning := game_center_term_warning[_]
]

game_center_term_warning contains data.swift.syntax.warning(call, "apple.hig.platform_services.review_game_center_term_casing", "Review visible Game Center string literal; use the Game Center term casing in custom UI.") if {
  call := data.swift.syntax.function_calls[_]
  visible_string_call(call)
  has_incorrect_game_center_term(call)
}

visible_string_call_names := {"Text", "Button", "Label", "Link", "TextField", "Alert", "help"}

visible_string_call(call) if {
  data.swift.syntax.call_named_in(call, visible_string_call_names)
}

visible_string_call(call) if {
  data.swift.syntax.call_named_in(call, visible_string_call_names)
}

has_incorrect_game_center_term(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  lower_count := count(split(lower(argument), "game center")) - 1
  correct_count := count(split(argument, "Game Center")) - 1
  lower_count > correct_count
}

has_incorrect_game_center_term(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  contains(lower(argument), "gamecenter")
}
