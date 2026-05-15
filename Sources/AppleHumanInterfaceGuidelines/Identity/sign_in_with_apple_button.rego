package apple.hig.identity.sign_in_with_apple_button

# METADATA
# scope: document
# entrypoint: true
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := sign_in_with_apple_button_warning[_]
]

sign_in_with_apple_button_warning contains data.swift.syntax.warning(call, "apple.hig.identity.review_custom_sign_in_with_apple_button", "Review Sign in with Apple control; prefer the system-provided button API.") if {
  call := data.swift.syntax.function_calls[_]
  custom_sign_in_surface_call(call)
  has_sign_in_with_apple_string_argument(call)
  not system_sign_in_with_apple_button_call(call)
}

custom_sign_in_surface_names := {"Button", "Text", "Label", "Link"}
system_sign_in_with_apple_button_names := {"ASAuthorizationAppleIDButton", "SignInWithAppleButton"}
sign_in_with_apple_titles := {"Sign in with Apple", "Sign In with Apple"}

custom_sign_in_surface_call(call) if {
  data.swift.syntax.call_named_in(call, custom_sign_in_surface_names)
}

custom_sign_in_surface_call(call) if {
  data.swift.syntax.call_named_in(call, custom_sign_in_surface_names)
}

system_sign_in_with_apple_button_call(call) if {
  data.swift.syntax.call_named_in(call, system_sign_in_with_apple_button_names)
}

system_sign_in_with_apple_button_call(call) if {
  data.swift.syntax.call_named_in(call, system_sign_in_with_apple_button_names)
}

has_sign_in_with_apple_string_argument(call) if {
  title := data.swift.syntax.string_literals(call)[_]
  sign_in_with_apple_titles[title]
}
