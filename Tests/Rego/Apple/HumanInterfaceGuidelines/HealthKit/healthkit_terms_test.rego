package apple.hig.healthkit.healthkit_terms

test_warns_for_visible_healthkit_copy if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/HealthView.swift", [
  data.swift.syntax.test.function_call(18, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Connect HealthKit")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.healthkit.review_user_facing_healthkit_term"
  result.warn[0].message == "Review visible HealthKit terminology; prefer Apple Health or the Apple Health app in user-facing copy."
  result.warn[0].artifact == "Sources/App/HealthView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_bad_apple_health_capitalization_variants if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/HealthView.swift", [
  data.swift.syntax.test.function_call(23, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Connect apple health")
      ]),
  data.swift.syntax.test.function_call(24, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Open Apple health")
      ]),
  data.swift.syntax.test.function_call(25, 9, [
        data.swift.syntax.test.identifier("Label"),
        data.swift.syntax.test.string_segment("Sync APPLE HEALTH data")
      ])
])

  count(result.warn) == 3
  result.warn[_].rule_id == "apple.hig.healthkit.review_user_facing_healthkit_term"
}

test_does_not_warn_for_apple_health_copy if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/HealthView.swift", [
  data.swift.syntax.test.function_call(24, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Connect the Apple Health app")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_non_visible_healthkit_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/HealthStore.swift", [
  data.swift.syntax.test.function_call(31, 13, [
        data.swift.syntax.test.identifier("Logger"),
        data.swift.syntax.test.identifier("subsystem"),
        data.swift.syntax.test.identifier("category"),
        data.swift.syntax.test.string_segment("com.example.app"),
        data.swift.syntax.test.string_segment("HealthKit")
      ])
])

  count(result.warn) == 0
}
