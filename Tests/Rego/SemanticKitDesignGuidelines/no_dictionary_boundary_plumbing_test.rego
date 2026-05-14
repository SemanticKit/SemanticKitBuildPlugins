package semantickit.design_guidelines.no_dictionary_boundary_plumbing

test_warns_for_dictionary_payload_assembly_in_sources if {
  result := decision with input as swift_syntax_input(
    "Sources/SemanticKitBuildPlugins/PolicyDiagnostics.swift",
    function_call(42, 13, ["Dictionary", "uniqueKeysWithValues", "rule_id", "message", "severity"]),
  )

  count(result.warn) == 1
  result.warn[0].rule_id == "semantickit.design_guidelines.no_dictionary_boundary_plumbing"
  result.warn[0].message == "Decode dictionary-shaped data at the boundary into typed models; do not let generic dictionary plumbing become implementation behavior."
  result.warn[0].artifact == "Sources/SemanticKitBuildPlugins/PolicyDiagnostics.swift"
  result.warn[0].line == 42
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_warns_for_dictionary_transform_in_sources if {
  result := decision with input as swift_syntax_input(
    "Sources/App/UserSettings.swift",
    function_call(9, 18, ["settings", "mapValues"]),
  )

  count(result.warn) == 1
  result.warn[0].rule_id == "semantickit.design_guidelines.no_dictionary_boundary_plumbing"
  result.warn[0].artifact == "Sources/App/UserSettings.swift"
  result.warn[0].line == 9
  result.warn[0].column == 18
}

test_warns_for_dictionary_key_string_plumbing_in_sources if {
  result := decision with input as swift_syntax_input(
    "Sources/App/RemotePayload.swift",
    function_call(21, 7, ["append", "message_id"]),
  )

  count(result.warn) == 1
  result.warn[0].rule_id == "semantickit.design_guidelines.no_dictionary_boundary_plumbing"
  result.warn[0].artifact == "Sources/App/RemotePayload.swift"
}

test_does_not_warn_for_typed_json_decode_boundary if {
  result := decision with input as swift_syntax_input(
    "Sources/App/RemotePayloadBoundary.swift",
    function_call(27, 11, ["JSONDecoder", "decode", "message_id"]),
  )

  count(result.warn) == 0
}

swift_syntax_input(artifact, syntax) := {
  "sourceFile": artifact,
  "swiftSyntax": syntax,
}

function_call(line, column, token_texts) := {
  "type": "FunctionCallExprSyntax",
  "range": {"start": {"line": line, "column": column}, "end": {"line": line, "column": column + 1}},
  "children": [token_node(text) | text := token_texts[_]],
}

token_node(text) := {
  "type": "TokenSyntax",
  "range": {"start": {"line": 0, "column": 0}, "end": {"line": 0, "column": 0}},
  "token": {"kind": "identifier", "text": text},
  "children": [],
}
