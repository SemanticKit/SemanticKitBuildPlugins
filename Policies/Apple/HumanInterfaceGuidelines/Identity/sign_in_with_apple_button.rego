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

sign_in_with_apple_button_warning contains {
  "rule_id": "apple.hig.identity.review_custom_sign_in_with_apple_button",
  "message": "Review Sign in with Apple control; prefer the system-provided button API.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  custom_sign_in_surface_call(fact)
  has_sign_in_with_apple_string_argument(fact)
  not system_sign_in_with_apple_button_call(fact)
}

custom_sign_in_surface_names := {"Button", "Text", "Label", "Link"}
system_sign_in_with_apple_button_names := {"ASAuthorizationAppleIDButton", "SignInWithAppleButton"}
sign_in_with_apple_titles := {"Sign in with Apple", "Sign In with Apple"}

custom_sign_in_surface_call(fact) if {
  custom_sign_in_surface_names[fact.baseName]
}

custom_sign_in_surface_call(fact) if {
  custom_sign_in_surface_names[fact.memberName]
}

system_sign_in_with_apple_button_call(fact) if {
  system_sign_in_with_apple_button_names[fact.baseName]
}

system_sign_in_with_apple_button_call(fact) if {
  system_sign_in_with_apple_button_names[fact.memberName]
}

has_sign_in_with_apple_string_argument(fact) if {
  title := fact.stringArguments[_]
  sign_in_with_apple_titles[title]
}
