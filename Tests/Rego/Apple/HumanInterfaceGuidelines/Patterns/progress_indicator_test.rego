package apple.hig.patterns.progress_indicator

test_warns_for_progress_view_with_no_arguments if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/RouteLoadingView.swift", [
  data.swift.syntax.test.function_call(14, 9, [
        data.swift.syntax.test.identifier("ProgressView")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_indeterminate_progress_indicator"
  result.warn[0].message == "Review indeterminate progress indicator; set expectations for long-running work."
  result.warn[0].artifact == "Sources/App/RouteLoadingView.swift"
  result.warn[0].line == 14
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_progress_view_with_label if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/RouteLoadingView.swift", [
  data.swift.syntax.test.function_call(22, 9, [
        data.swift.syntax.test.identifier("ProgressView"),
        data.swift.syntax.test.string_segment("Loading route")
      ])
])

  count(result.warn) == 0
}
