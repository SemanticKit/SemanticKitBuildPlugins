package apple.hig.platform_services.airplay_term_noun
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := airplay_term_noun_warning[_]
]

airplay_term_noun_visible_string_call_names := {"Text", "Button", "Label", "Link", "TextField", "Alert", "help"}

modified_airplay_terms := {
  "airplaying",
  "airplayed",
  "airplays",
  "airplayable",
}

airplay_term_noun_warning contains {
  "rule_id": "apple.hig.platform_services.review_airplay_term_as_noun",
  "message": "Review visible AirPlay string literal; use AirPlay as a noun and avoid modifying the term.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  # `name(...)` or the modifier form `base.name(...)`
  reference := {callee, callee.children[count(callee.children) - 1]}[_]
  reference.type == "DeclReferenceExprSyntax"
  airplay_term_noun_visible_string_call_names[reference.children[0].token.text]
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
  term := modified_airplay_terms[_]
  contains(lower(argument), term)
}
