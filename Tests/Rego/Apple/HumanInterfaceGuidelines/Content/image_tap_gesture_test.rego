package apple.hig.content.image_tap_gesture

test_warns_for_on_tap_gesture if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/GalleryView.swift", [
  data.swift.syntax.test.function_call(22, 15, [
        data.swift.syntax.test.identifier("onTapGesture")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.content.review_tap_gesture_action"
  result.warn[0].message == "Review tap gesture action; use a Button when visible content initiates an action."
  result.warn[0].artifact == "Sources/App/GalleryView.swift"
  result.warn[0].line == 22
  result.warn[0].column == 15
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_button_open if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/GalleryView.swift", [
  data.swift.syntax.test.function_call(30, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Open")
      ])
])

  count(result.warn) == 0
}
