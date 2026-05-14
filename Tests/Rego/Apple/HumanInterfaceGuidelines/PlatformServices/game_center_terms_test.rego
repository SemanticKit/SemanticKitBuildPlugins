package apple.hig.platform_services.game_center_terms

test_warns_for_lowercase_game_center_term_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/Game/MenuView.swift", [
  data.swift.syntax.test.function_call(21, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Open game center")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.platform_services.review_game_center_term_casing"
  result.warn[0].message == "Review visible Game Center string literal; use the Game Center term casing in custom UI."
  result.warn[0].artifact == "Sources/Game/MenuView.swift"
  result.warn[0].line == 21
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_gamecenter_without_space_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/Game/MenuView.swift", [
  data.swift.syntax.test.function_call(28, 9, [
        data.swift.syntax.test.identifier("Label"),
        data.swift.syntax.test.string_segment("Open GameCenter")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.platform_services.review_game_center_term_casing"
}

test_does_not_warn_for_correct_game_center_term_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/Game/MenuView.swift", [
  data.swift.syntax.test.function_call(36, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Open Game Center")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_non_visible_game_center_string_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/Game/GameCenterClient.swift", [
  data.swift.syntax.test.function_call(44, 17, [
        data.swift.syntax.test.identifier("Logger"),
        data.swift.syntax.test.identifier("subsystem"),
        data.swift.syntax.test.string_segment("game center")
      ])
])

  count(result.warn) == 0
}
