package apple.hig.inputs.sensitive_secure_text_entry

test_warns_for_password_textfield_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/LoginView.swift", [
  data.swift.syntax.test.function_call(19, 11, [
        data.swift.syntax.test.identifier("TextField"),
        data.swift.syntax.test.string_segment("Password")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.inputs.review_sensitive_secure_text_entry"
  result.warn[0].message == "Review sensitive text entry; use SecureField or secure text entry for passwords, passcodes, PINs, security codes, and CVV values."
  result.warn[0].artifact == "Sources/App/LoginView.swift"
  result.warn[0].line == 19
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_warns_for_sensitive_textfield_variants if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/VerificationView.swift", [
  data.swift.syntax.test.function_call(21, 13, [
        data.swift.syntax.test.identifier("TextField"),
        data.swift.syntax.test.string_segment("Enter PIN")
      ]),
  data.swift.syntax.test.function_call(35, 13, [
        data.swift.syntax.test.identifier("TextField"),
        data.swift.syntax.test.string_segment("CVV")
      ]),
  data.swift.syntax.test.function_call(42, 13, [
        data.swift.syntax.test.identifier("TextField"),
        data.swift.syntax.test.string_segment("Security code")
      ])
])

  count(result.warn) == 3
  result.warn[_].rule_id == "apple.hig.inputs.review_sensitive_secure_text_entry"
}

test_does_not_warn_for_securefield_password_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/LoginView.swift", [
  data.swift.syntax.test.function_call(27, 11, [
        data.swift.syntax.test.identifier("SecureField"),
        data.swift.syntax.test.string_segment("Password")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_non_sensitive_textfield_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ProfileView.swift", [
  data.swift.syntax.test.function_call(16, 11, [
        data.swift.syntax.test.identifier("TextField"),
        data.swift.syntax.test.string_segment("Display name")
      ])
])

  count(result.warn) == 0
}
