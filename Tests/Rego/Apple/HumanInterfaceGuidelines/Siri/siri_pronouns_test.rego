package apple.hig.siri.siri_pronouns

test_warns_for_text_with_siri_pronoun_copy if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ShortcutsView.swift",
          "line": 24,
          "column": 13,
          "calledExpression": "Text",
          "baseName": "Text",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Ask Siri what she can do"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.siri.review_siri_pronoun_copy"
  result.warn[0].message == "Review Siri copy; refer to Siri by name instead of using pronouns such as she, him, or her."
  result.warn[0].artifact == "Sources/App/ShortcutsView.swift"
  result.warn[0].line == 24
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_warns_for_visible_string_call_names_with_siri_pronoun_copy if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ShortcutsView.swift",
          "line": 31,
          "column": 9,
          "calledExpression": "Label",
          "baseName": "Label",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Siri will remind her"],
          "numericArguments": []
        },
        {
          "artifact": "Sources/App/ShortcutsView.swift",
          "line": 32,
          "column": 9,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Ask SIRI about HIM"],
          "numericArguments": []
        },
        {
          "artifact": "Sources/App/ShortcutsView.swift",
          "line": 33,
          "column": 9,
          "calledExpression": "TextField",
          "baseName": "TextField",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Ask Siri what she can do"],
          "numericArguments": []
        },
        {
          "artifact": "Sources/App/ShortcutsView.swift",
          "line": 34,
          "column": 10,
          "calledExpression": "view.help",
          "baseName": "",
          "memberName": "help",
          "argumentLabels": ["_"],
          "stringArguments": ["Siri will remind her"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 4
}

test_does_not_warn_for_supported_call_with_siri_named_directly if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ShortcutsView.swift",
          "line": 42,
          "column": 13,
          "calledExpression": "Text",
          "baseName": "Text",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Ask Siri what Siri can do"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}

test_does_not_warn_for_unsupported_call_with_siri_pronoun_copy if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ShortcutsView.swift",
          "line": 48,
          "column": 9,
          "calledExpression": "Image",
          "baseName": "Image",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Ask Siri to help him"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}

test_warns_for_non_exact_siri_pronoun_copy if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ShortcutsView.swift",
          "line": 56,
          "column": 13,
          "calledExpression": "Text",
          "baseName": "Text",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Ask Siri what she can do today"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
}
