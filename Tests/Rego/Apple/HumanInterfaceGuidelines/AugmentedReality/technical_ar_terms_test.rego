package apple.hig.augmented_reality.technical_ar_terms

test_warns_for_exact_technical_ar_terms_in_visible_string_calls if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ARInstructions.swift",
          "line": 17,
          "column": 11,
          "calledExpression": "Text",
          "baseName": "Text",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["ARKit"],
          "numericArguments": []
        },
        {
          "artifact": "Sources/App/ARInstructions.swift",
          "line": 18,
          "column": 11,
          "calledExpression": "Label",
          "baseName": "Label",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["World Detection"],
          "numericArguments": []
        },
        {
          "artifact": "Sources/App/ARInstructions.swift",
          "line": 19,
          "column": 11,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["Tracking"],
          "numericArguments": []
        },
        {
          "artifact": "Sources/App/ARInstructions.swift",
          "line": 20,
          "column": 11,
          "calledExpression": ".help",
          "baseName": "",
          "memberName": "help",
          "argumentLabels": [],
          "stringArguments": ["World tracking"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 4
  result.warn[0].rule_id == "apple.hig.augmented_reality.review_technical_ar_terms"
  result.warn[0].message == "Review AR instructional text; use approachable terms instead of technical AR terminology."
  result.warn[0].artifact == "Sources/App/ARInstructions.swift"
  result.warn[0].line == 17
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_warns_for_text_field_exact_technical_ar_term if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ARSetupView.swift",
          "line": 29,
          "column": 9,
          "calledExpression": "TextField",
          "baseName": "TextField",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Tracking"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.augmented_reality.review_technical_ar_terms"
  result.warn[0].artifact == "Sources/App/ARSetupView.swift"
  result.warn[0].line == 29
  result.warn[0].column == 9
}

test_does_not_warn_for_approachable_ar_instructional_text if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ARInstructions.swift",
          "line": 24,
          "column": 11,
          "calledExpression": "Text",
          "baseName": "Text",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["Move your device to find a surface"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}

test_warns_for_substring_and_case_different_terms if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ARInstructions.swift",
          "line": 31,
          "column": 11,
          "calledExpression": "Text",
          "baseName": "Text",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["Use ARKit to scan the room"],
          "numericArguments": []
        },
        {
          "artifact": "Sources/App/ARInstructions.swift",
          "line": 32,
          "column": 11,
          "calledExpression": "Text",
          "baseName": "Text",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["world detection"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 2
  result.warn[0].rule_id == "apple.hig.augmented_reality.review_technical_ar_terms"
  result.warn[0].message == "Review AR instructional text; use approachable terms instead of technical AR terminology."
  result.warn[0].artifact == "Sources/App/ARInstructions.swift"
  result.warn[0].line == 31
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
  result.warn[1].rule_id == "apple.hig.augmented_reality.review_technical_ar_terms"
  result.warn[1].artifact == "Sources/App/ARInstructions.swift"
  result.warn[1].line == 32
  result.warn[1].column == 11
}

test_does_not_warn_for_exact_term_on_non_visible_call if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ARState.swift",
          "line": 12,
          "column": 5,
          "calledExpression": "logEvent",
          "baseName": "logEvent",
          "memberName": "",
          "argumentLabels": ["name"],
          "stringArguments": ["ARKit"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
