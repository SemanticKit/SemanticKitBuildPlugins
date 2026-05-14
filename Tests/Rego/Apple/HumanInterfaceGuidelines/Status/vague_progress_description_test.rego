package apple.hig.status.vague_progress_description

test_warns_for_progress_view_loading_description if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ImportProgressView.swift", [
  data.swift.syntax.test.function_call(18, 11, [
        data.swift.syntax.test.identifier("ProgressView"),
        data.swift.syntax.test.string_segment("loading")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.status.review_vague_progress_description"
  result.warn[0].message == "Review progress description; use accurate, succinct text instead of vague status copy."
  result.warn[0].artifact == "Sources/App/ImportProgressView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_warns_for_each_configured_vague_progress_description if {
  import_result := decision with input as data.swift.syntax.test.source_input("Sources/App/ImportProgressView.swift", [
    data.swift.syntax.test.function_call(20, 11, [
        data.swift.syntax.test.identifier("ProgressView"),
        data.swift.syntax.test.string_segment("Loading...")
      ]),
  ])

  export_result := decision with input as data.swift.syntax.test.source_input("Sources/App/ExportProgressView.swift", [
    data.swift.syntax.test.function_call(24, 9, [
        data.swift.syntax.test.identifier("ProgressView"),
        data.swift.syntax.test.string_segment("Please wait")
      ]),
  ])

  sync_result := decision with input as data.swift.syntax.test.source_input("Sources/App/SyncProgressView.swift", [
    data.swift.syntax.test.function_call(31, 13, [
        data.swift.syntax.test.identifier("ProgressView"),
        data.swift.syntax.test.string_segment("Working")
      ]),
  ])

  auth_result := decision with input as data.swift.syntax.test.source_input("Sources/App/AuthProgressView.swift", [
    data.swift.syntax.test.function_call(34, 13, [
        data.swift.syntax.test.identifier("ProgressView"),
        data.swift.syntax.test.string_segment("Authenticating")
      ])
  ])

  count(import_result.warn) == 1
  count(export_result.warn) == 1
  count(sync_result.warn) == 1
  count(auth_result.warn) == 1
  import_result.warn[0].artifact == "Sources/App/ImportProgressView.swift"
  export_result.warn[0].artifact == "Sources/App/ExportProgressView.swift"
  sync_result.warn[0].artifact == "Sources/App/SyncProgressView.swift"
  auth_result.warn[0].artifact == "Sources/App/AuthProgressView.swift"
  import_result.warn[0].line == 20
  export_result.warn[0].line == 24
  sync_result.warn[0].line == 31
  auth_result.warn[0].line == 34
}

test_does_not_warn_for_descriptive_progress_description if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ImportProgressView.swift", [
  data.swift.syntax.test.function_call(36, 11, [
        data.swift.syntax.test.identifier("ProgressView"),
        data.swift.syntax.test.string_segment("Importing photos")
      ])
])

  count(result.warn) == 0
}

test_warns_for_case_insensitive_vague_progress_description if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SyncProgressView.swift", [
  data.swift.syntax.test.function_call(42, 11, [
        data.swift.syntax.test.identifier("ProgressView"),
        data.swift.syntax.test.string_segment("loading")
      ])
])

  count(result.warn) == 1
  result.warn[0].artifact == "Sources/App/SyncProgressView.swift"
}

test_does_not_warn_for_vague_text_on_unrelated_call if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ImportProgressView.swift", [
  data.swift.syntax.test.function_call(49, 11, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Loading")
      ])
])

  count(result.warn) == 0
}
