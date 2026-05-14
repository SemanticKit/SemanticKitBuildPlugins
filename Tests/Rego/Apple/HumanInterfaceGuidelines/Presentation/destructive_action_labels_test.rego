package apple.hig.presentation.destructive_action_labels

test_warns_for_button_delete_route_label if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/RouteView.swift", [
  data.swift.syntax.test.function_call(18, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Delete Route")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_destructive_action_label"
  result.warn[0].message == "Review destructive action; use destructive styling and provide a clear cancel path."
  result.warn[0].artifact == "Sources/App/RouteView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_button_save_route_label if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/RouteView.swift", [
  data.swift.syntax.test.function_call(24, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Save Route")
      ])
])

  count(result.warn) == 0
}
