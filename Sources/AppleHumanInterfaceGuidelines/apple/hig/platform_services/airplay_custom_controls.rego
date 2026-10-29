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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee_name := callee.children[0].token.text
  custom_airplay_surface_names[callee_name]
  not apple_provided_airplay_names[callee_name]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  argument := segment.children[0].token.text
  indexof(argument, "AirPlay") >= 0
}
