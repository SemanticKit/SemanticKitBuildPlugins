package apple.hig.platform_services.apple_pay_term_casing
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := apple_pay_term_casing_warning[_]
]

apple_pay_term_casing_visible_string_call_names := {"Text", "Button", "Label", "Link", "TextField", "Alert", "help"}

apple_pay_term_casing_warning contains {
  "rule_id": "apple.hig.platform_services.review_apple_pay_term_casing",
  "message": "Review visible Apple Pay string literal; use the Apple Pay term casing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  apple_pay_term_casing_visible_string_call_names[callee.children[0].token.text]
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
  lower_count := count(split(lower(argument), "apple pay")) - 1
  correct_count := count(split(argument, "Apple Pay")) - 1
  lower_count > correct_count
}

apple_pay_term_casing_warning contains {
  "rule_id": "apple.hig.platform_services.review_apple_pay_term_casing",
  "message": "Review visible Apple Pay string literal; use the Apple Pay term casing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  apple_pay_term_casing_visible_string_call_names[callee.children[0].token.text]
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
  contains(lower(argument), "applepay")
}

apple_pay_term_casing_warning contains {
  "rule_id": "apple.hig.platform_services.review_apple_pay_term_casing",
  "message": "Review visible Apple Pay string literal; use the Apple Pay term casing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  apple_pay_term_casing_visible_string_call_names[callee.children[0].token.text]
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
  contains(lower(argument), "apple-pay")
}
