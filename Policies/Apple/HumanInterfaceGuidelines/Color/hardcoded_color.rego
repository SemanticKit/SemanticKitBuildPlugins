package apple.hig.color.hardcoded_color

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := hardcoded_color_warning[_]
]

hardcoded_color_warning contains {
  "rule_id": "apple.hig.color.review_hardcoded_color",
  "message": "Review hardcoded color; prefer system colors.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  hardcoded_color_call(fact)
}

color_constructor_names := {"Color", "UIColor", "NSColor"}
rgb_red_labels := {"red", "calibratedRed", "deviceRed", "srgbRed", "displayP3Red"}
hue_labels := {"hue", "calibratedHue", "deviceHue"}

hardcoded_color_call(fact) if {
  color_constructor_call(fact)
  has_color_component_labels(fact)
  has_numeric_argument(fact)
}

color_constructor_call(fact) if {
  color_constructor_names[fact.baseName]
}

color_constructor_call(fact) if {
  color_constructor_names[fact.memberName]
}

has_color_component_labels(fact) if {
  has_rgb_labels(fact)
}

has_color_component_labels(fact) if {
  has_hsb_labels(fact)
}

has_rgb_labels(fact) if {
  has_any_argument_label(fact, rgb_red_labels)
  has_argument_label(fact, "green")
  has_argument_label(fact, "blue")
}

has_hsb_labels(fact) if {
  has_any_argument_label(fact, hue_labels)
  has_argument_label(fact, "saturation")
  has_argument_label(fact, "brightness")
}

has_argument_label(fact, label) if {
  fact.argumentLabels[_] == label
}

has_any_argument_label(fact, labels) if {
  label := fact.argumentLabels[_]
  labels[label]
}

has_numeric_argument(fact) if {
  count(fact.numericArguments) > 0
}
