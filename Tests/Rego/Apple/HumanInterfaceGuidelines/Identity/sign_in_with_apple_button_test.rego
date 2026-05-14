package apple.hig.identity.sign_in_with_apple_button

test_warns_for_custom_button_with_sign_in_with_apple_text if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/LoginView.swift",
          "line": 42,
          "column": 13,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Sign in with Apple"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.identity.review_custom_sign_in_with_apple_button"
  result.warn[0].message == "Review Sign in with Apple control; prefer the system-provided button API."
  result.warn[0].artifact == "Sources/App/LoginView.swift"
  result.warn[0].line == 42
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_asauthorizationappleidbutton if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/LoginView.swift",
          "line": 55,
          "column": 9,
          "calledExpression": "ASAuthorizationAppleIDButton",
          "baseName": "ASAuthorizationAppleIDButton",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["Sign in with Apple"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
