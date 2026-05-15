package apple.hig.color.hardcoded_color

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
  warning := hardcoded_color_warning[_]
]

hardcoded_color_warning contains data.swift.syntax.warning(call, "apple.hig.color.review_hardcoded_color", "Review hardcoded color; prefer system colors.") if {
  call := data.swift.syntax.function_calls[_]
  hardcoded_color_call(call)
}

color_constructor_names := {"Color", "UIColor", "NSColor"}
rgb_red_labels := {"red", "calibratedRed", "deviceRed", "srgbRed", "displayP3Red"}
hue_labels := {"hue", "calibratedHue", "deviceHue"}

hardcoded_color_call(call) if {
  color_constructor_call(call)
  has_color_component_labels(call)
  has_numeric_argument(call)
}

color_constructor_call(call) if {
  data.swift.syntax.call_named_in(call, color_constructor_names)
}

color_constructor_call(call) if {
  data.swift.syntax.call_named_in(call, color_constructor_names)
}

has_color_component_labels(call) if {
  has_rgb_labels(call)
}

has_color_component_labels(call) if {
  has_hsb_labels(call)
}

has_rgb_labels(call) if {
  has_any_argument_label(call, rgb_red_labels)
  has_argument_label(call, "green")
  has_argument_label(call, "blue")
}

has_hsb_labels(call) if {
  has_any_argument_label(call, hue_labels)
  has_argument_label(call, "saturation")
  has_argument_label(call, "brightness")
}

has_argument_label(call, label) if {
  data.swift.syntax.argument_label(call, label)
}

has_any_argument_label(call, labels) if {
  label := data.swift.syntax.argument_labels(call)[_]
  labels[label]
}

has_numeric_argument(call) if {
  data.swift.syntax.has_numeric_argument(call)
}
