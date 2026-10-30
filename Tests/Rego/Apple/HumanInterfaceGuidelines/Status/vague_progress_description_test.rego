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
warns_for_progress_view_loading_description_node := {"declReferenceExprs": [{"baseName": "ProgressView", "range": {"end": {"column": 23, "line": 18}, "start": {"column": 11, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 33, "line": 18}, "start": {"column": 24, "line": 18}}, "segments": [{"stringSegment": {"content": "loading", "range": {"end": {"column": 32, "line": 18}, "start": {"column": 25, "line": 18}}}}]}}, "range": {"end": {"column": 33, "line": 18}, "start": {"column": 24, "line": 18}}}], "calledExpression": {"declReferenceExpr": {"baseName": "ProgressView", "range": {"end": {"column": 23, "line": 18}, "start": {"column": 11, "line": 18}}}}, "range": {"end": {"column": 34, "line": 18}, "start": {"column": 11, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 33, "line": 18}, "start": {"column": 24, "line": 18}}, "segments": [{"stringSegment": {"content": "loading", "range": {"end": {"column": 32, "line": 18}, "start": {"column": 25, "line": 18}}}}]}]}

# Parser output for `ProgressView("Loading...")` at 20:11.
warns_for_each_configured_vague_progress_description_import_result_node := {"declReferenceExprs": [{"baseName": "ProgressView", "range": {"end": {"column": 23, "line": 20}, "start": {"column": 11, "line": 20}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 36, "line": 20}, "start": {"column": 24, "line": 20}}, "segments": [{"stringSegment": {"content": "Loading...", "range": {"end": {"column": 35, "line": 20}, "start": {"column": 25, "line": 20}}}}]}}, "range": {"end": {"column": 36, "line": 20}, "start": {"column": 24, "line": 20}}}], "calledExpression": {"declReferenceExpr": {"baseName": "ProgressView", "range": {"end": {"column": 23, "line": 20}, "start": {"column": 11, "line": 20}}}}, "range": {"end": {"column": 37, "line": 20}, "start": {"column": 11, "line": 20}}}], "stringLiteralExprs": [{"range": {"end": {"column": 36, "line": 20}, "start": {"column": 24, "line": 20}}, "segments": [{"stringSegment": {"content": "Loading...", "range": {"end": {"column": 35, "line": 20}, "start": {"column": 25, "line": 20}}}}]}]}

# Parser output for `ProgressView("Please wait")` at 24:9.
warns_for_each_configured_vague_progress_description_export_result_node := {"declReferenceExprs": [{"baseName": "ProgressView", "range": {"end": {"column": 21, "line": 24}, "start": {"column": 9, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 35, "line": 24}, "start": {"column": 22, "line": 24}}, "segments": [{"stringSegment": {"content": "Please wait", "range": {"end": {"column": 34, "line": 24}, "start": {"column": 23, "line": 24}}}}]}}, "range": {"end": {"column": 35, "line": 24}, "start": {"column": 22, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "ProgressView", "range": {"end": {"column": 21, "line": 24}, "start": {"column": 9, "line": 24}}}}, "range": {"end": {"column": 36, "line": 24}, "start": {"column": 9, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 35, "line": 24}, "start": {"column": 22, "line": 24}}, "segments": [{"stringSegment": {"content": "Please wait", "range": {"end": {"column": 34, "line": 24}, "start": {"column": 23, "line": 24}}}}]}]}

# Parser output for `ProgressView("Working")` at 31:13.
warns_for_each_configured_vague_progress_description_sync_result_node := {"declReferenceExprs": [{"baseName": "ProgressView", "range": {"end": {"column": 25, "line": 31}, "start": {"column": 13, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 35, "line": 31}, "start": {"column": 26, "line": 31}}, "segments": [{"stringSegment": {"content": "Working", "range": {"end": {"column": 34, "line": 31}, "start": {"column": 27, "line": 31}}}}]}}, "range": {"end": {"column": 35, "line": 31}, "start": {"column": 26, "line": 31}}}], "calledExpression": {"declReferenceExpr": {"baseName": "ProgressView", "range": {"end": {"column": 25, "line": 31}, "start": {"column": 13, "line": 31}}}}, "range": {"end": {"column": 36, "line": 31}, "start": {"column": 13, "line": 31}}}], "stringLiteralExprs": [{"range": {"end": {"column": 35, "line": 31}, "start": {"column": 26, "line": 31}}, "segments": [{"stringSegment": {"content": "Working", "range": {"end": {"column": 34, "line": 31}, "start": {"column": 27, "line": 31}}}}]}]}

# Parser output for `ProgressView("Authenticating")` at 34:13.
warns_for_each_configured_vague_progress_description_auth_result_node := {"declReferenceExprs": [{"baseName": "ProgressView", "range": {"end": {"column": 25, "line": 34}, "start": {"column": 13, "line": 34}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 42, "line": 34}, "start": {"column": 26, "line": 34}}, "segments": [{"stringSegment": {"content": "Authenticating", "range": {"end": {"column": 41, "line": 34}, "start": {"column": 27, "line": 34}}}}]}}, "range": {"end": {"column": 42, "line": 34}, "start": {"column": 26, "line": 34}}}], "calledExpression": {"declReferenceExpr": {"baseName": "ProgressView", "range": {"end": {"column": 25, "line": 34}, "start": {"column": 13, "line": 34}}}}, "range": {"end": {"column": 43, "line": 34}, "start": {"column": 13, "line": 34}}}], "stringLiteralExprs": [{"range": {"end": {"column": 42, "line": 34}, "start": {"column": 26, "line": 34}}, "segments": [{"stringSegment": {"content": "Authenticating", "range": {"end": {"column": 41, "line": 34}, "start": {"column": 27, "line": 34}}}}]}]}

# Parser output for `ProgressView("Importing photos")` at 36:11.
does_not_warn_for_descriptive_progress_description_node := {"declReferenceExprs": [{"baseName": "ProgressView", "range": {"end": {"column": 23, "line": 36}, "start": {"column": 11, "line": 36}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 42, "line": 36}, "start": {"column": 24, "line": 36}}, "segments": [{"stringSegment": {"content": "Importing photos", "range": {"end": {"column": 41, "line": 36}, "start": {"column": 25, "line": 36}}}}]}}, "range": {"end": {"column": 42, "line": 36}, "start": {"column": 24, "line": 36}}}], "calledExpression": {"declReferenceExpr": {"baseName": "ProgressView", "range": {"end": {"column": 23, "line": 36}, "start": {"column": 11, "line": 36}}}}, "range": {"end": {"column": 43, "line": 36}, "start": {"column": 11, "line": 36}}}], "stringLiteralExprs": [{"range": {"end": {"column": 42, "line": 36}, "start": {"column": 24, "line": 36}}, "segments": [{"stringSegment": {"content": "Importing photos", "range": {"end": {"column": 41, "line": 36}, "start": {"column": 25, "line": 36}}}}]}]}

# Parser output for `ProgressView("loading")` at 42:11.
warns_for_case_insensitive_vague_progress_description_node := {"declReferenceExprs": [{"baseName": "ProgressView", "range": {"end": {"column": 23, "line": 42}, "start": {"column": 11, "line": 42}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 33, "line": 42}, "start": {"column": 24, "line": 42}}, "segments": [{"stringSegment": {"content": "loading", "range": {"end": {"column": 32, "line": 42}, "start": {"column": 25, "line": 42}}}}]}}, "range": {"end": {"column": 33, "line": 42}, "start": {"column": 24, "line": 42}}}], "calledExpression": {"declReferenceExpr": {"baseName": "ProgressView", "range": {"end": {"column": 23, "line": 42}, "start": {"column": 11, "line": 42}}}}, "range": {"end": {"column": 34, "line": 42}, "start": {"column": 11, "line": 42}}}], "stringLiteralExprs": [{"range": {"end": {"column": 33, "line": 42}, "start": {"column": 24, "line": 42}}, "segments": [{"stringSegment": {"content": "loading", "range": {"end": {"column": 32, "line": 42}, "start": {"column": 25, "line": 42}}}}]}]}

# Parser output for `Text("Loading")` at 49:11.
does_not_warn_for_vague_text_on_unrelated_call_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 15, "line": 49}, "start": {"column": 11, "line": 49}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 25, "line": 49}, "start": {"column": 16, "line": 49}}, "segments": [{"stringSegment": {"content": "Loading", "range": {"end": {"column": 24, "line": 49}, "start": {"column": 17, "line": 49}}}}]}}, "range": {"end": {"column": 25, "line": 49}, "start": {"column": 16, "line": 49}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 15, "line": 49}, "start": {"column": 11, "line": 49}}}}, "range": {"end": {"column": 26, "line": 49}, "start": {"column": 11, "line": 49}}}], "stringLiteralExprs": [{"range": {"end": {"column": 25, "line": 49}, "start": {"column": 16, "line": 49}}, "segments": [{"stringSegment": {"content": "Loading", "range": {"end": {"column": 24, "line": 49}, "start": {"column": 17, "line": 49}}}}]}]}
