package apple.hig.platform_services.apple_pay_button
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
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
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee_name := callee.baseName
  custom_payment_surface_names[callee_name]
  not apple_pay_api_names[callee_name]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  indexof(argument, "Apple Pay") >= 0
}
