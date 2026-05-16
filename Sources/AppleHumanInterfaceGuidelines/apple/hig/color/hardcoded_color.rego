# METADATA
# scope: package
# entrypoint: true
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
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  color_constructor_names[callee.children[0].token.text]

  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  red_argument := argument_list.children[_]
  rgb_red_labels[red_argument.children[0].token.text]
  green_argument := argument_list.children[_]
  green_argument.children[0].token.text == "green"
  blue_argument := argument_list.children[_]
  blue_argument.children[0].token.text == "blue"

  numeric_argument := argument_list.children[_]
  literal := numeric_argument.children[_]
  {"IntegerLiteralExprSyntax", "FloatLiteralExprSyntax"}[literal.type]
}

hardcoded_color_warning contains {
  "rule_id": "apple.hig.color.review_hardcoded_color",
  "message": "Review hardcoded color; prefer system colors.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  color_constructor_names[callee.children[0].token.text]

  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  hue_argument := argument_list.children[_]
  hue_labels[hue_argument.children[0].token.text]
  saturation_argument := argument_list.children[_]
  saturation_argument.children[0].token.text == "saturation"
  brightness_argument := argument_list.children[_]
  brightness_argument.children[0].token.text == "brightness"

  numeric_argument := argument_list.children[_]
  literal := numeric_argument.children[_]
  {"IntegerLiteralExprSyntax", "FloatLiteralExprSyntax"}[literal.type]
}

color_constructor_names := {"Color", "UIColor", "NSColor"}
rgb_red_labels := {"red", "calibratedRed", "deviceRed", "srgbRed", "displayP3Red"}
hue_labels := {"hue", "calibratedHue", "deviceHue"}
