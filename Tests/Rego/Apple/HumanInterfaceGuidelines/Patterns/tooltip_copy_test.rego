package apple.hig.patterns.tooltip_copy

test_warns_for_help_base_name_with_long_tooltip_copy if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/RouteToolbar.swift",
          "line": 31,
          "column": 14,
          "calledExpression": ".help",
          "baseName": "help",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Open route planning controls and show detailed guidance for every available route option"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_tooltip_copy"
  result.warn[0].message == "Review tooltip copy; describe the control directly and keep help text around 60 to 75 characters."
  result.warn[0].artifact == "Sources/App/RouteToolbar.swift"
  result.warn[0].line == 31
  result.warn[0].column == 14
  result.warn[0].severity == "warning"
}

test_warns_for_help_member_name_with_long_tooltip_copy if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/RouteToolbar.swift",
          "line": 44,
          "column": 10,
          "calledExpression": "view.help",
          "baseName": "",
          "memberName": "help",
          "argumentLabels": ["_"],
          "stringArguments": ["Review all routing controls and choose the setting that best matches the selected trip"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_tooltip_copy"
  result.warn[0].artifact == "Sources/App/RouteToolbar.swift"
  result.warn[0].line == 44
  result.warn[0].column == 10
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_help_call_with_short_tooltip_copy if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/RouteToolbar.swift",
          "line": 52,
          "column": 14,
          "calledExpression": ".help",
          "baseName": "help",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Show route options"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}

test_does_not_warn_for_non_help_call_with_long_copy if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/RouteToolbar.swift",
          "line": 60,
          "column": 12,
          "calledExpression": "Text",
          "baseName": "Text",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Open route planning controls and show detailed guidance for every available route option"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
