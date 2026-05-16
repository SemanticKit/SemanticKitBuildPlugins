# METADATA
# scope: package
# entrypoint: true
package apple.hig.identity.sign_in_with_apple_button
default decision := {"deny": [], "warn": [], "note": []}

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
  call := input
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee_name := callee.children[0].token.text
  custom_sign_in_surface_names[callee_name]
  not system_sign_in_with_apple_button_names[callee_name]

  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  argument := argument_list.children[_]
  literal := argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  sign_in_with_apple_titles[segment.children[0].token.text]
}
