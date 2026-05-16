# METADATA
# scope: package
# entrypoint: true
package apple.hig.navigation.generic_search_placeholder
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := generic_search_placeholder_warning[_]
]

search_field_call_names := {"TextField", "SearchField", "NSSearchField"}

generic_search_placeholder_warning contains {
  "rule_id": "apple.hig.navigation.review_generic_search_placeholder",
  "message": "Review search field placeholder; describe what people can search for instead of using generic Search text.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  search_field_call_names[callee.children[0].token.text]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  placeholder := segment.children[0].token.text
  placeholder == "Search"
}

generic_search_placeholder_warning contains {
  "rule_id": "apple.hig.navigation.review_generic_search_placeholder",
  "message": "Review search field placeholder; describe what people can search for instead of using generic Search text.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "searchable"
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  labeled_argument.children[0].token.text == "prompt"
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  placeholder := segment.children[0].token.text
  placeholder == "Search"
}
