package apple.hig.color.hardcoded_color
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
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
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  callee := call.calledExpression.declReferenceExpr
  color_constructor_names[callee.baseName]

  some red_argument in call.arguments
  rgb_red_labels[red_argument.label]
  some green_argument in call.arguments
  green_argument.label == "green"
  some blue_argument in call.arguments
  blue_argument.label == "blue"

  some numeric_argument in call.arguments
  literal := number_literal(numeric_argument.expression)
}

hardcoded_color_warning contains {
  "rule_id": "apple.hig.color.review_hardcoded_color",
  "message": "Review hardcoded color; prefer system colors.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  callee := call.calledExpression.declReferenceExpr
  color_constructor_names[callee.baseName]

  some hue_argument in call.arguments
  hue_labels[hue_argument.label]
  some saturation_argument in call.arguments
  saturation_argument.label == "saturation"
  some brightness_argument in call.arguments
  brightness_argument.label == "brightness"

  some numeric_argument in call.arguments
  literal := number_literal(numeric_argument.expression)
}

color_constructor_names := {"Color", "UIColor", "NSColor"}
rgb_red_labels := {"red", "calibratedRed", "deviceRed", "srgbRed", "displayP3Red"}
hue_labels := {"hue", "calibratedHue", "deviceHue"}

# A number written as a literal: `44`, `0.5`.
number_literal(expression) := expression.integerLiteralExpr

number_literal(expression) := expression.floatLiteralExpr
