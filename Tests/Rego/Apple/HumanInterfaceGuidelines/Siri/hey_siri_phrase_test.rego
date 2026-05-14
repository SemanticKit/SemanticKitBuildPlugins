package apple.hig.siri.hey_siri_phrase

test_warns_for_app_shortcut_phrase_with_hey_siri_comma if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/AppShortcuts.swift",
          "line": 17,
          "column": 11,
          "calledExpression": "AppShortcut",
          "baseName": "AppShortcut",
          "memberName": "",
          "argumentLabels": ["intent", "phrases", "shortTitle", "systemImageName"],
          "stringArguments": ["Hey Siri, show my garden"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.siri.review_hey_siri_phrase"
  result.warn[0].message == "Review suggested Siri phrase; do not commandeer core Siri commands or include Hey Siri."
  result.warn[0].artifact == "Sources/App/AppShortcuts.swift"
  result.warn[0].line == 17
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_warns_for_member_app_shortcut_phrase_case_insensitively if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/AppShortcuts.swift",
          "line": 28,
          "column": 8,
          "calledExpression": ".AppShortcut",
          "baseName": "",
          "memberName": "AppShortcut",
          "argumentLabels": ["phrases"],
          "stringArguments": ["Use HEY SIRI to open Today"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.siri.review_hey_siri_phrase"
  result.warn[0].artifact == "Sources/App/AppShortcuts.swift"
  result.warn[0].line == 28
  result.warn[0].column == 8
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_text_with_hey_siri if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/SiriTipsView.swift",
          "line": 35,
          "column": 11,
          "calledExpression": "Text",
          "baseName": "Text",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Hey Siri"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}

test_does_not_warn_for_app_shortcut_phrase_without_hey_siri if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/AppShortcuts.swift",
          "line": 42,
          "column": 13,
          "calledExpression": "AppShortcut",
          "baseName": "AppShortcut",
          "memberName": "",
          "argumentLabels": ["intent", "phrases", "shortTitle", "systemImageName"],
          "stringArguments": ["Show my garden"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}

test_does_not_warn_for_app_shortcut_hey_siri_outside_phrases_argument if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/AppShortcuts.swift",
          "line": 49,
          "column": 13,
          "calledExpression": "AppShortcut",
          "baseName": "AppShortcut",
          "memberName": "",
          "argumentLabels": ["intent", "shortTitle", "systemImageName"],
          "stringArguments": ["Hey Siri"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
