package apple.hig.platform_services.airplay_custom_controls

test_warns_for_custom_button_with_airplay_text if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/PlayerView.swift",
          "line": 18,
          "column": 11,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["AirPlay"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.platform_services.review_custom_airplay_control"
  result.warn[0].message == "Review custom AirPlay control; use Apple-provided AirPlay affordances."
  result.warn[0].artifact == "Sources/App/PlayerView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_avroutepickerview if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/PlayerView.swift",
          "line": 27,
          "column": 9,
          "calledExpression": "AVRoutePickerView",
          "baseName": "AVRoutePickerView",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["AirPlay"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
