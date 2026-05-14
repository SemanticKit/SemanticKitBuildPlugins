package apple.hig.inputs.sensitive_secure_text_entry

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := sensitive_secure_text_entry_warning[_]
]

sensitive_secure_text_entry_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.inputs.review_sensitive_secure_text_entry", "Review sensitive text entry; use SecureField or secure text entry for passwords, passcodes, PINs, security codes, and CVV values.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  text_field_call(call)
  has_sensitive_text_field_label(call)
}

text_field_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "TextField")
}

text_field_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "TextField")
}

sensitive_text_terms := {"password", "passcode", "security code", "cvv"}

has_sensitive_text_field_label(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  term := sensitive_text_terms[_]
  contains(lower(argument), term)
}

has_sensitive_text_field_label(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  label := lower(argument)
  label == "pin"
}

has_sensitive_text_field_label(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  label := lower(argument)
  startswith(label, "pin ")
}

has_sensitive_text_field_label(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  label := lower(argument)
  contains(label, " pin")
}
