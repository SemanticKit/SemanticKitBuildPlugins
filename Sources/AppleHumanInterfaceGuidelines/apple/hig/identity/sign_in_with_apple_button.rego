package apple.hig.identity.sign_in_with_apple_button
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := sign_in_with_apple_button_warning[_]
]

custom_sign_in_surface_names := {"Button", "Text", "Label", "Link"}
system_sign_in_with_apple_button_names := {"ASAuthorizationAppleIDButton", "SignInWithAppleButton"}
sign_in_with_apple_titles := {"Sign in with Apple", "Sign In with Apple"}

sign_in_with_apple_button_warning contains {
  "rule_id": "apple.hig.identity.review_custom_sign_in_with_apple_button",
  "message": "Review Sign in with Apple control; prefer the system-provided button API.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  callee := call.calledExpression.declReferenceExpr
  callee_name := callee.baseName
  custom_sign_in_surface_names[callee_name]
  not system_sign_in_with_apple_button_names[callee_name]

  some argument in call.arguments
  literal := argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  sign_in_with_apple_titles[segment.content]
}
