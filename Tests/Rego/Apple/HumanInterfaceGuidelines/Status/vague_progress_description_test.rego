package apple.hig.status.vague_progress_description

test_warns_for_progress_view_loading_description if {
  result := decision with input as warns_for_progress_view_loading_description_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.status.review_vague_progress_description"
  result.warn[0].message == "Review progress description; use accurate, succinct text instead of vague status copy."
  result.warn[0].line == 18
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_warns_for_each_configured_vague_progress_description if {
  import_result := decision with input as warns_for_each_configured_vague_progress_description_import_result_node

  export_result := decision with input as warns_for_each_configured_vague_progress_description_export_result_node

  sync_result := decision with input as warns_for_each_configured_vague_progress_description_sync_result_node

  auth_result := decision with input as warns_for_each_configured_vague_progress_description_auth_result_node

  count(import_result.warn) == 1
  count(export_result.warn) == 1
  count(sync_result.warn) == 1
  count(auth_result.warn) == 1
  import_result.warn[0].line == 20
  export_result.warn[0].line == 24
  sync_result.warn[0].line == 31
  auth_result.warn[0].line == 34
}

test_does_not_warn_for_descriptive_progress_description if {
  result := decision with input as does_not_warn_for_descriptive_progress_description_node

  count(result.warn) == 0
}

test_warns_for_case_insensitive_vague_progress_description if {
  result := decision with input as warns_for_case_insensitive_vague_progress_description_node

  count(result.warn) == 1
}

test_does_not_warn_for_vague_text_on_unrelated_call if {
  result := decision with input as does_not_warn_for_vague_text_on_unrelated_call_node

  count(result.warn) == 0
}

# Parser output for `ProgressView("loading")` at 18:11.
warns_for_progress_view_loading_description_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 34}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 23}}, "token": {"kind": "identifier", "text": "ProgressView"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 23}, "end": {"line": 18, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 24}, "end": {"line": 18, "column": 33}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 24}, "end": {"line": 18, "column": 33}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 24}, "end": {"line": 18, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 24}, "end": {"line": 18, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 25}, "end": {"line": 18, "column": 32}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 25}, "end": {"line": 18, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 25}, "end": {"line": 18, "column": 32}}, "token": {"kind": "stringSegment", "text": "loading"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 33}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 33}, "end": {"line": 18, "column": 34}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 34}, "end": {"line": 18, "column": 34}}, "children": []},
]}

# Parser output for `ProgressView("Loading...")` at 20:11.
warns_for_each_configured_vague_progress_description_import_result_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 20, "column": 11}, "end": {"line": 20, "column": 37}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 20, "column": 11}, "end": {"line": 20, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 11}, "end": {"line": 20, "column": 23}}, "token": {"kind": "identifier", "text": "ProgressView"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 23}, "end": {"line": 20, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 20, "column": 24}, "end": {"line": 20, "column": 36}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 20, "column": 24}, "end": {"line": 20, "column": 36}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 20, "column": 24}, "end": {"line": 20, "column": 36}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 24}, "end": {"line": 20, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 20, "column": 25}, "end": {"line": 20, "column": 35}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 20, "column": 25}, "end": {"line": 20, "column": 35}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 25}, "end": {"line": 20, "column": 35}}, "token": {"kind": "stringSegment", "text": "Loading..."}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 35}, "end": {"line": 20, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 36}, "end": {"line": 20, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 20, "column": 37}, "end": {"line": 20, "column": 37}}, "children": []},
]}

# Parser output for `ProgressView("Please wait")` at 24:9.
warns_for_each_configured_vague_progress_description_export_result_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 36}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 21}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 21}}, "token": {"kind": "identifier", "text": "ProgressView"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 21}, "end": {"line": 24, "column": 22}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 22}, "end": {"line": 24, "column": 35}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 22}, "end": {"line": 24, "column": 35}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 22}, "end": {"line": 24, "column": 35}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 22}, "end": {"line": 24, "column": 23}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 23}, "end": {"line": 24, "column": 34}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 23}, "end": {"line": 24, "column": 34}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 23}, "end": {"line": 24, "column": 34}}, "token": {"kind": "stringSegment", "text": "Please wait"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 34}, "end": {"line": 24, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 35}, "end": {"line": 24, "column": 36}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 36}, "end": {"line": 24, "column": 36}}, "children": []},
]}

# Parser output for `ProgressView("Working")` at 31:13.
warns_for_each_configured_vague_progress_description_sync_result_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 13}, "end": {"line": 31, "column": 36}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 13}, "end": {"line": 31, "column": 25}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 13}, "end": {"line": 31, "column": 25}}, "token": {"kind": "identifier", "text": "ProgressView"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 25}, "end": {"line": 31, "column": 26}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 26}, "end": {"line": 31, "column": 35}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 26}, "end": {"line": 31, "column": 35}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 26}, "end": {"line": 31, "column": 35}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 26}, "end": {"line": 31, "column": 27}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 27}, "end": {"line": 31, "column": 34}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 27}, "end": {"line": 31, "column": 34}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 27}, "end": {"line": 31, "column": 34}}, "token": {"kind": "stringSegment", "text": "Working"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 34}, "end": {"line": 31, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 35}, "end": {"line": 31, "column": 36}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 36}, "end": {"line": 31, "column": 36}}, "children": []},
]}

# Parser output for `ProgressView("Authenticating")` at 34:13.
warns_for_each_configured_vague_progress_description_auth_result_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 34, "column": 13}, "end": {"line": 34, "column": 43}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 34, "column": 13}, "end": {"line": 34, "column": 25}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 13}, "end": {"line": 34, "column": 25}}, "token": {"kind": "identifier", "text": "ProgressView"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 25}, "end": {"line": 34, "column": 26}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 34, "column": 26}, "end": {"line": 34, "column": 42}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 34, "column": 26}, "end": {"line": 34, "column": 42}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 34, "column": 26}, "end": {"line": 34, "column": 42}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 26}, "end": {"line": 34, "column": 27}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 34, "column": 27}, "end": {"line": 34, "column": 41}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 34, "column": 27}, "end": {"line": 34, "column": 41}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 27}, "end": {"line": 34, "column": 41}}, "token": {"kind": "stringSegment", "text": "Authenticating"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 41}, "end": {"line": 34, "column": 42}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 42}, "end": {"line": 34, "column": 43}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 34, "column": 43}, "end": {"line": 34, "column": 43}}, "children": []},
]}

# Parser output for `ProgressView("Importing photos")` at 36:11.
does_not_warn_for_descriptive_progress_description_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 36, "column": 11}, "end": {"line": 36, "column": 43}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 36, "column": 11}, "end": {"line": 36, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 11}, "end": {"line": 36, "column": 23}}, "token": {"kind": "identifier", "text": "ProgressView"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 23}, "end": {"line": 36, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 36, "column": 24}, "end": {"line": 36, "column": 42}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 36, "column": 24}, "end": {"line": 36, "column": 42}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 36, "column": 24}, "end": {"line": 36, "column": 42}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 24}, "end": {"line": 36, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 36, "column": 25}, "end": {"line": 36, "column": 41}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 36, "column": 25}, "end": {"line": 36, "column": 41}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 25}, "end": {"line": 36, "column": 41}}, "token": {"kind": "stringSegment", "text": "Importing photos"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 41}, "end": {"line": 36, "column": 42}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 42}, "end": {"line": 36, "column": 43}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 36, "column": 43}, "end": {"line": 36, "column": 43}}, "children": []},
]}

# Parser output for `ProgressView("loading")` at 42:11.
warns_for_case_insensitive_vague_progress_description_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 34}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 23}}, "token": {"kind": "identifier", "text": "ProgressView"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 23}, "end": {"line": 42, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 33}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 33}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 25}, "end": {"line": 42, "column": 32}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 25}, "end": {"line": 42, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 25}, "end": {"line": 42, "column": 32}}, "token": {"kind": "stringSegment", "text": "loading"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 32}, "end": {"line": 42, "column": 33}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 33}, "end": {"line": 42, "column": 34}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 34}, "end": {"line": 42, "column": 34}}, "children": []},
]}

# Parser output for `Text("Loading")` at 49:11.
does_not_warn_for_vague_text_on_unrelated_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 49, "column": 11}, "end": {"line": 49, "column": 26}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 49, "column": 11}, "end": {"line": 49, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 11}, "end": {"line": 49, "column": 15}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 15}, "end": {"line": 49, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 49, "column": 16}, "end": {"line": 49, "column": 25}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 49, "column": 16}, "end": {"line": 49, "column": 25}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 49, "column": 16}, "end": {"line": 49, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 16}, "end": {"line": 49, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 49, "column": 17}, "end": {"line": 49, "column": 24}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 49, "column": 17}, "end": {"line": 49, "column": 24}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 17}, "end": {"line": 49, "column": 24}}, "token": {"kind": "stringSegment", "text": "Loading"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 24}, "end": {"line": 49, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 25}, "end": {"line": 49, "column": 26}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 49, "column": 26}, "end": {"line": 49, "column": 26}}, "children": []},
]}
