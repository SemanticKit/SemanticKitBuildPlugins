package semantickit.main

test_main_decision_aggregates_apple_hig_warnings if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/SiriTipsView.swift",
          "line": 17,
          "column": 11,
          "calledExpression": "AppShortcut",
          "baseName": "AppShortcut",
          "memberName": "",
          "argumentLabels": ["intent", "phrases", "shortTitle", "systemImageName"],
          "stringArguments": ["Hey Siri, plan a route"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.deny) == 0
  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.siri.review_hey_siri_phrase"
  result.warn[0].message == "Review suggested Siri phrase; do not commandeer core Siri commands or include Hey Siri."
  result.warn[0].artifact == "Sources/App/SiriTipsView.swift"
  result.warn[0].line == 17
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}
