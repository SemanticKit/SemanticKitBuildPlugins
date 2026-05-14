package apple.hig.layout.safe_area

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := safe_area_warning[_]
]

safe_area_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.layout.review_safe_area_opt_out", "Review this visible safe-area opt-out against Apple HIG layout guidance: respect safe areas, margins, and guides.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  safe_area_opt_out_call(call)
}

safe_area_opt_out_names := {"ignoresSafeArea", "edgesIgnoringSafeArea"}

safe_area_opt_out_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, safe_area_opt_out_names)
}

safe_area_opt_out_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, safe_area_opt_out_names)
}
