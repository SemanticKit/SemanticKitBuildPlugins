# METADATA
# scope: package
# entrypoint: true
package apple.hig.platform_services.apple_pay_button
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := apple_pay_button_warning[_]
]

custom_payment_surface_names := {"Button", "Text", "Label", "Link"}
apple_pay_api_names := {"PKPaymentButton", "PayWithApplePayButton", "ApplePayButton"}

apple_pay_button_warning contains {
  "rule_id": "apple.hig.platform_services.review_custom_apple_pay_button",
  "message": "Review Apple Pay button; use Apple-provided APIs and avoid custom Apple Pay button text or logos.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee_name := callee.children[0].token.text
  custom_payment_surface_names[callee_name]
  not apple_pay_api_names[callee_name]
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
  indexof(argument, "Apple Pay") >= 0
}
