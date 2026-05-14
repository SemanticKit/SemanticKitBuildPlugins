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

custom_airplay_control_warning contains {
  "rule_id": "apple.hig.platform_services.review_custom_airplay_control",
  "message": "Review custom AirPlay control; use Apple-provided AirPlay affordances.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  custom_interactive_airplay_surface_call(fact)
  has_airplay_string_argument(fact)
  not apple_provided_airplay_call(fact)
}

custom_airplay_surface_names := {"Button", "Text", "Label", "Link"}
apple_provided_airplay_names := {"AVRoutePickerView", "AirPlayButton"}

custom_interactive_airplay_surface_call(fact) if {
  custom_airplay_surface_names[fact.baseName]
}

custom_interactive_airplay_surface_call(fact) if {
  custom_airplay_surface_names[fact.memberName]
}

apple_provided_airplay_call(fact) if {
  apple_provided_airplay_names[fact.baseName]
}

apple_provided_airplay_call(fact) if {
  apple_provided_airplay_names[fact.memberName]
}

has_airplay_string_argument(fact) if {
  argument := fact.stringArguments[_]
  indexof(argument, "AirPlay") >= 0
}
