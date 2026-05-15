package apple.hig.platform_services.airplay_term_noun

test_warns_for_modified_airplay_term_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/PlayerView.swift", [
  data.swift.syntax.test.function_call(20, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("AirPlaying to living room")
      ])
])

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_as_noun"
  ]
  count(warnings) == 1
  warnings[0].message == "Review visible AirPlay string literal; use AirPlay as a noun and avoid modifying the term."
  warnings[0].artifact == "Sources/App/PlayerView.swift"
  warnings[0].line == 20
  warnings[0].column == 9
  warnings[0].severity == "warning"
}

test_does_not_warn_for_noun_airplay_term_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/PlayerView.swift", [
  data.swift.syntax.test.function_call(27, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Use AirPlay with speakers")
      ])
])

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_as_noun"
  ]
  count(warnings) == 0
}

test_does_not_warn_for_non_visible_modified_airplay_term_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/PlaybackLogger.swift", [
  data.swift.syntax.test.function_call(35, 13, [
        data.swift.syntax.test.identifier("Logger"),
        data.swift.syntax.test.identifier("subsystem"),
        data.swift.syntax.test.string_segment("airplaying")
      ])
])

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_as_noun"
  ]
  count(warnings) == 0
}
