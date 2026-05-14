package apple.hig.platform_services.airplay_custom_controls

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_airplay_control_warning[_]
]

custom_airplay_control_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.platform_services.review_custom_airplay_control", "Review custom AirPlay control; use Apple-provided AirPlay affordances.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  custom_interactive_airplay_surface_call(call)
  has_airplay_string_argument(call)
  not apple_provided_airplay_call(call)
}

custom_airplay_surface_names := {"Button", "Text", "Label", "Link"}
apple_provided_airplay_names := {"AVRoutePickerView", "AirPlayButton"}

custom_interactive_airplay_surface_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, custom_airplay_surface_names)
}

custom_interactive_airplay_surface_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, custom_airplay_surface_names)
}

apple_provided_airplay_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, apple_provided_airplay_names)
}

apple_provided_airplay_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, apple_provided_airplay_names)
}

has_airplay_string_argument(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  indexof(argument, "AirPlay") >= 0
}
