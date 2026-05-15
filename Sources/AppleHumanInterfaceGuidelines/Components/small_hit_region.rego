package apple.hig.components.small_hit_region

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
  warning := small_hit_region_warning[_]
]

small_hit_region_warning contains data.swift.syntax.warning(call, "apple.hig.components.review_small_hit_region", "Review explicit small frame dimensions; width or height below 44 pt may affect interactive hit regions.") if {
  call := data.swift.syntax.function_calls[_]
  frame_call(call)
  has_argument_label(call, "width")
  has_argument_label(call, "height")
  has_small_numeric_argument(call)
}

frame_call(call) if {
  data.swift.syntax.call_named(call, "frame")
}

frame_call(call) if {
  data.swift.syntax.call_named(call, "frame")
}

has_argument_label(call, label) if {
  data.swift.syntax.argument_label(call, label)
}

has_small_numeric_argument(call) if {
  value := data.swift.syntax.numeric_literals(call)[_]
  dimension := to_number(value)
  dimension < 44
}
