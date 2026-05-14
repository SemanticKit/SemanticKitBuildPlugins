package apple.hig.patterns.rating_prompt

test_warns_for_custom_button_with_rate_text if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/SettingsView.swift",
          "line": 42,
          "column": 17,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Rate This App"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_custom_rating_prompt"
  result.warn[0].message == "Review custom rating prompt; prefer the system rating prompt and ask only after engagement."
  result.warn[0].artifact == "Sources/App/SettingsView.swift"
  result.warn[0].line == 42
  result.warn[0].column == 17
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_request_review_call if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/SettingsView.swift",
          "line": 51,
          "column": 9,
          "calledExpression": "requestReview",
          "baseName": "requestReview",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["Review"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
