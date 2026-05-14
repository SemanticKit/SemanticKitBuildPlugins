package apple.hig.patterns.share_button

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_share_button_warning[_]
]

custom_share_button_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.patterns.review_custom_share_button", "Review custom Share control; prefer ShareLink or the system share sheet where available.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  custom_share_surface_call(call)
  has_visible_share_string_argument(call)
  not sharelink_call(call)
}

custom_share_surface_names := {"Button", "Text", "Label", "Link"}

custom_share_surface_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, custom_share_surface_names)
}

custom_share_surface_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, custom_share_surface_names)
}

sharelink_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "ShareLink")
}

sharelink_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "ShareLink")
}

has_visible_share_string_argument(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  argument == "Share"
}

has_visible_share_string_argument(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  indexof(argument, "Share ") >= 0
}

has_visible_share_string_argument(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  indexof(argument, " share") >= 0
}
