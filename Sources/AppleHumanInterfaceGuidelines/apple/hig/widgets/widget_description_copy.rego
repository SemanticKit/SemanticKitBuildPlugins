package apple.hig.widgets.widget_description_copy
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := widget_description_lead_in_warning[_]
]

discouraged_widget_description_lead_ins := {"this widget shows", "use this widget to", "add this widget"}

widget_description_lead_in_warning contains {
  "rule_id": "apple.hig.widgets.review_widget_description_lead_in",
  "message": "Review widget description lead-in; start with an action verb instead of boilerplate widget copy.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "description"
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  string := segment.children[0].token.text
  description := lower(string)
  lead_in := discouraged_widget_description_lead_ins[_]
  startswith(description, lead_in)
}

widget_description_lead_in_warning contains {
  "rule_id": "apple.hig.widgets.review_widget_description_lead_in",
  "message": "Review widget description lead-in; start with an action verb instead of boilerplate widget copy.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[_]
  member.token.text == "description"
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  string := segment.children[0].token.text
  description := lower(string)
  lead_in := discouraged_widget_description_lead_ins[_]
  startswith(description, lead_in)
}

widget_description_lead_in_warning contains {
  "rule_id": "apple.hig.widgets.review_widget_description_lead_in",
  "message": "Review widget description lead-in; start with an action verb instead of boilerplate widget copy.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[_]
  member.children[0].token.text == "description"
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  string := segment.children[0].token.text
  description := lower(string)
  lead_in := discouraged_widget_description_lead_ins[_]
  startswith(description, lead_in)
}
