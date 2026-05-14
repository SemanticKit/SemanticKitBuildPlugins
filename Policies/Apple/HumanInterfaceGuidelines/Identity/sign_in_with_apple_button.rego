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

sign_in_with_apple_button_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.identity.review_custom_sign_in_with_apple_button", "Review Sign in with Apple control; prefer the system-provided button API.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  custom_sign_in_surface_call(call)
  has_sign_in_with_apple_string_argument(call)
  not system_sign_in_with_apple_button_call(call)
}

custom_sign_in_surface_names := {"Button", "Text", "Label", "Link"}
system_sign_in_with_apple_button_names := {"ASAuthorizationAppleIDButton", "SignInWithAppleButton"}
sign_in_with_apple_titles := {"Sign in with Apple", "Sign In with Apple"}

custom_sign_in_surface_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, custom_sign_in_surface_names)
}

custom_sign_in_surface_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, custom_sign_in_surface_names)
}

system_sign_in_with_apple_button_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, system_sign_in_with_apple_button_names)
}

system_sign_in_with_apple_button_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, system_sign_in_with_apple_button_names)
}

has_sign_in_with_apple_string_argument(call) if {
  title := data.apple.hig.swift_syntax.string_literals(call)[_]
  sign_in_with_apple_titles[title]
}
