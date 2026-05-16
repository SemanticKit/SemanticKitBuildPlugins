# METADATA
# scope: package
# entrypoint: true
package apple.hig.platform_services.game_center_terms
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := game_center_term_warning[_]
]

visible_string_call_names := {"Text", "Button", "Label", "Link", "TextField", "Alert", "help"}

game_center_term_warning contains {
  "rule_id": "apple.hig.platform_services.review_game_center_term_casing",
  "message": "Review visible Game Center string literal; use the Game Center term casing in custom UI.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  visible_string_call_names[callee.children[0].token.text]
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
  lower_count := count(split(lower(argument), "game center")) - 1
  correct_count := count(split(argument, "Game Center")) - 1
  lower_count > correct_count
}

game_center_term_warning contains {
  "rule_id": "apple.hig.platform_services.review_game_center_term_casing",
  "message": "Review visible Game Center string literal; use the Game Center term casing in custom UI.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  visible_string_call_names[callee.children[0].token.text]
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
  contains(lower(argument), "gamecenter")
}
