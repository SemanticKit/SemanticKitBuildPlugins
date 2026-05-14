package apple.hig.widgets.widget_description_copy

test_warns_for_widget_description_boilerplate_lead_in if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/TrailWidget.swift", [
  data.swift.syntax.test.function_call(28, 8, [
        data.swift.syntax.test.identifier("description"),
        data.swift.syntax.test.string_segment("This widget shows current trail conditions")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.widgets.review_widget_description_lead_in"
  result.warn[0].message == "Review widget description lead-in; start with an action verb instead of boilerplate widget copy."
  result.warn[0].artifact == "Sources/App/TrailWidget.swift"
  result.warn[0].line == 28
  result.warn[0].column == 8
  result.warn[0].severity == "warning"
}

test_warns_for_each_discouraged_widget_description_lead_in if {
  forecast_result := decision with input as data.swift.syntax.test.source_input("Sources/App/ForecastWidget.swift", [
    data.swift.syntax.test.function_call(31, 10, [
        data.swift.syntax.test.identifier("description"),
        data.swift.syntax.test.string_segment("Use this widget to check the forecast")
      ]),
  ])

  checklist_result := decision with input as data.swift.syntax.test.source_input("Sources/App/ChecklistWidget.swift", [
    data.swift.syntax.test.function_call(42, 10, [
        data.swift.syntax.test.identifier("description"),
        data.swift.syntax.test.string_segment("Add this widget for quick checklist access")
      ])
  ])

  count(forecast_result.warn) == 1
  count(checklist_result.warn) == 1
  forecast_result.warn[0].artifact == "Sources/App/ForecastWidget.swift"
  checklist_result.warn[0].artifact == "Sources/App/ChecklistWidget.swift"
  forecast_result.warn[0].line == 31
  checklist_result.warn[0].line == 42
}

test_does_not_warn_for_action_verb_widget_description if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/TrailWidget.swift", [
  data.swift.syntax.test.function_call(33, 8, [
        data.swift.syntax.test.identifier("description"),
        data.swift.syntax.test.string_segment("Check current trail conditions")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_boilerplate_on_unrelated_call if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/TrailWidget.swift", [
  data.swift.syntax.test.function_call(44, 12, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("This widget shows current trail conditions")
      ])
])

  count(result.warn) == 0
}
