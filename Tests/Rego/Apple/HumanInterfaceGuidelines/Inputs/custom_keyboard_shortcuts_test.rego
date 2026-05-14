package apple.hig.inputs.custom_keyboard_shortcuts

test_warns_for_custom_keyboard_shortcut_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/Commands.swift",
          "line": 18,
          "column": 12,
          "calledExpression": ".keyboardShortcut",
          "baseName": "keyboardShortcut",
          "memberName": "keyboardShortcut",
          "argumentLabels": [],
          "stringArguments": ["R"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.inputs.review_custom_keyboard_shortcut"
  result.warn[0].message == "Review custom keyboard shortcut; prefer standard shortcuts and define custom shortcuts only when necessary."
  result.warn[0].artifact == "Sources/App/Commands.swift"
  result.warn[0].line == 18
  result.warn[0].column == 12
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_non_keyboard_shortcut_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/Commands.swift",
          "line": 24,
          "column": 10,
          "calledExpression": ".buttonStyle",
          "baseName": "buttonStyle",
          "memberName": "buttonStyle",
          "argumentLabels": [],
          "stringArguments": ["R"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
