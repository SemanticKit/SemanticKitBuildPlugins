package apple.hig.platform_services.airplay_custom_controls
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_airplay_control_warning[_]
]

custom_airplay_surface_names := {"Button", "Text", "Label", "Link"}
apple_provided_airplay_names := {"AVRoutePickerView", "AirPlayButton"}

custom_airplay_control_warning contains {
  "rule_id": "apple.hig.platform_services.review_custom_airplay_control",
  "message": "Review custom AirPlay control; use Apple-provided AirPlay affordances.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee_name := callee.baseName
  custom_airplay_surface_names[callee_name]
  not apple_provided_airplay_names[callee_name]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  indexof(argument, "AirPlay") >= 0
}
