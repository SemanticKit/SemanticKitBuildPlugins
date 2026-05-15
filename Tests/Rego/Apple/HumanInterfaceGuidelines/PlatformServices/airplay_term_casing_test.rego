package apple.hig.platform_services.airplay_term_casing

test_warns_for_lowercase_airplay_term_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/PlayerView.swift", [
  data.swift.syntax.test.function_call(18, 11, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Open airplay settings")
      ])
])

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_casing"
  ]
  count(warnings) == 1
  warnings[0].message == "Review visible AirPlay string literal; use the AirPlay term casing."
  warnings[0].artifact == "Sources/App/PlayerView.swift"
  warnings[0].line == 18
  warnings[0].column == 11
  warnings[0].severity == "warning"
}

test_warns_for_spaced_airplay_term_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/PlayerView.swift", [
  data.swift.syntax.test.function_call(24, 13, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Choose Air Play")
      ])
])

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_casing"
  ]
  count(warnings) == 1
}

test_does_not_warn_for_correct_airplay_term_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/PlayerView.swift", [
  data.swift.syntax.test.function_call(31, 9, [
        data.swift.syntax.test.identifier("Label"),
        data.swift.syntax.test.string_segment("Use AirPlay")
      ])
])

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_casing"
  ]
  count(warnings) == 0
}

test_does_not_warn_for_non_visible_airplay_string_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/PlaybackLogger.swift", [
  data.swift.syntax.test.function_call(44, 17, [
        data.swift.syntax.test.identifier("Logger"),
        data.swift.syntax.test.identifier("subsystem"),
        data.swift.syntax.test.string_segment("airplay")
      ])
])

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_casing"
  ]
  count(warnings) == 0
}
