package apple.hig.sharing.shareplay_term

test_warns_for_shareplaying_text_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SharePlayView.swift", [
  data.swift.syntax.test.function_call(22, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Start SharePlaying now")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.sharing.review_shareplay_term"
  result.warn[0].message == "Review visible SharePlay terminology; use SharePlay as a noun or direct-action verb without modifying the term."
  result.warn[0].artifact == "Sources/App/SharePlayView.swift"
  result.warn[0].line == 22
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_modified_shareplay_variants if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SharePlayView.swift", [
  data.swift.syntax.test.function_call(25, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Share-play")
      ]),
  data.swift.syntax.test.function_call(26, 9, [
        data.swift.syntax.test.identifier("Label"),
        data.swift.syntax.test.string_segment("SharePlay session")
      ]),
  data.swift.syntax.test.function_call(27, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Share play with friends")
      ])
])

  count(result.warn) == 3
  result.warn[_].rule_id == "apple.hig.sharing.review_shareplay_term"
}

test_does_not_warn_for_normal_shareplay_text_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SharePlayView.swift", [
  data.swift.syntax.test.function_call(36, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Start SharePlay")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_non_visible_shareplay_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SharePlayView.swift", [
  data.swift.syntax.test.function_call(44, 11, [
        data.swift.syntax.test.identifier("ActivityMetadata"),
        data.swift.syntax.test.string_segment("shareplaying")
      ])
])

  count(result.warn) == 0
}
