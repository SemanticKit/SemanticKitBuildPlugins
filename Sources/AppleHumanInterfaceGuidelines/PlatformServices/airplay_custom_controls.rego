package apple.hig.platform_services.airplay_custom_controls

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
  warning := custom_airplay_control_warning[_]
]

custom_airplay_control_warning contains data.swift.syntax.warning(call, "apple.hig.platform_services.review_custom_airplay_control", "Review custom AirPlay control; use Apple-provided AirPlay affordances.") if {
  call := data.swift.syntax.function_calls[_]
  custom_interactive_airplay_surface_call(call)
  has_airplay_string_argument(call)
  not apple_provided_airplay_call(call)
}

custom_airplay_surface_names := {"Button", "Text", "Label", "Link"}
apple_provided_airplay_names := {"AVRoutePickerView", "AirPlayButton"}

custom_interactive_airplay_surface_call(call) if {
  data.swift.syntax.call_named_in(call, custom_airplay_surface_names)
}

apple_provided_airplay_call(call) if {
  data.swift.syntax.call_named_in(call, apple_provided_airplay_names)
}

has_airplay_string_argument(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  indexof(argument, "AirPlay") >= 0
}
