package apple.hig.siri.voice_shortcut_terms

test_warns_for_text_add_voice_shortcut_lowercase_hig_example if {
	result := decision with input as warns_for_text_add_voice_shortcut_lowercase_hig_example_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.siri.review_voice_shortcut_terms"
	result.warn[0].message == "Review visible Siri shortcut terminology; avoid phrases such as Add Voice Shortcut, Make a Voice Command, or Create Voice Prompt."
	result.warn[0].line == 21
	result.warn[0].column == 15
	result.warn[0].severity == "warning"
}

test_warns_for_visible_string_call_phrase_variants if {
	result := {"warn": [warning |
    node := warns_for_visible_string_call_phrase_variants_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

	count(result.warn) == 3
}

test_warns_for_help_member_make_voice_command_lowercase_substring if {
	result := decision with input as warns_for_help_member_make_voice_command_lowercase_substring_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.siri.review_voice_shortcut_terms"
	result.warn[0].line == 34
	result.warn[0].column == 8
	result.warn[0].severity == "warning"
}

test_warns_for_textfield_create_voice_prompt_lowercase_substring if {
	result := decision with input as warns_for_textfield_create_voice_prompt_lowercase_substring_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.siri.review_voice_shortcut_terms"
	result.warn[0].line == 47
	result.warn[0].column == 19
	result.warn[0].severity == "warning"
}

test_does_not_warn_for_non_matching_visible_string if {
	result := decision with input as does_not_warn_for_non_matching_visible_string_node

	count(result.warn) == 0
}

test_does_not_warn_for_non_visible_call_with_matching_string if {
	result := decision with input as does_not_warn_for_non_visible_call_with_matching_string_node

	count(result.warn) == 0
}

# Parser output for `Text("add voice shortcut")` at 21:15.
warns_for_text_add_voice_shortcut_lowercase_hig_example_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 19, "line": 21}, "start": {"column": 15, "line": 21}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 40, "line": 21}, "start": {"column": 20, "line": 21}}, "segments": [{"stringSegment": {"content": "add voice shortcut", "range": {"end": {"column": 39, "line": 21}, "start": {"column": 21, "line": 21}}}}]}}, "range": {"end": {"column": 40, "line": 21}, "start": {"column": 20, "line": 21}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 19, "line": 21}, "start": {"column": 15, "line": 21}}}}, "range": {"end": {"column": 41, "line": 21}, "start": {"column": 15, "line": 21}}}], "stringLiteralExprs": [{"range": {"end": {"column": 40, "line": 21}, "start": {"column": 20, "line": 21}}, "segments": [{"stringSegment": {"content": "add voice shortcut", "range": {"end": {"column": 39, "line": 21}, "start": {"column": 21, "line": 21}}}}]}]}

# Parser output for `Label("add voice shortcuts", systemImage: "mic")` at 28:9.
# Parser output for `Button("Make it easy to add voice shortcuts", action: addShortcut)` at 29:9.
# Parser output for `Text("Use this to ADD VOICE SHORTCUT")` at 30:9.
warns_for_visible_string_call_phrase_variants_nodes := [
  {"declReferenceExprs": [{"baseName": "Label", "range": {"end": {"column": 14, "line": 28}, "start": {"column": 9, "line": 28}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 36, "line": 28}, "start": {"column": 15, "line": 28}}, "segments": [{"stringSegment": {"content": "add voice shortcuts", "range": {"end": {"column": 35, "line": 28}, "start": {"column": 16, "line": 28}}}}]}}, "range": {"end": {"column": 37, "line": 28}, "start": {"column": 15, "line": 28}}}, {"expression": {"stringLiteralExpr": {"range": {"end": {"column": 56, "line": 28}, "start": {"column": 51, "line": 28}}, "segments": [{"stringSegment": {"content": "mic", "range": {"end": {"column": 55, "line": 28}, "start": {"column": 52, "line": 28}}}}]}}, "label": "systemImage", "range": {"end": {"column": 56, "line": 28}, "start": {"column": 38, "line": 28}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Label", "range": {"end": {"column": 14, "line": 28}, "start": {"column": 9, "line": 28}}}}, "range": {"end": {"column": 57, "line": 28}, "start": {"column": 9, "line": 28}}}], "stringLiteralExprs": [{"range": {"end": {"column": 36, "line": 28}, "start": {"column": 15, "line": 28}}, "segments": [{"stringSegment": {"content": "add voice shortcuts", "range": {"end": {"column": 35, "line": 28}, "start": {"column": 16, "line": 28}}}}]}, {"range": {"end": {"column": 56, "line": 28}, "start": {"column": 51, "line": 28}}, "segments": [{"stringSegment": {"content": "mic", "range": {"end": {"column": 55, "line": 28}, "start": {"column": 52, "line": 28}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 29}, "start": {"column": 9, "line": 29}}}, {"baseName": "addShortcut", "range": {"end": {"column": 74, "line": 29}, "start": {"column": 63, "line": 29}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 53, "line": 29}, "start": {"column": 16, "line": 29}}, "segments": [{"stringSegment": {"content": "Make it easy to add voice shortcuts", "range": {"end": {"column": 52, "line": 29}, "start": {"column": 17, "line": 29}}}}]}}, "range": {"end": {"column": 54, "line": 29}, "start": {"column": 16, "line": 29}}}, {"expression": {"declReferenceExpr": {"baseName": "addShortcut", "range": {"end": {"column": 74, "line": 29}, "start": {"column": 63, "line": 29}}}}, "label": "action", "range": {"end": {"column": 74, "line": 29}, "start": {"column": 55, "line": 29}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 29}, "start": {"column": 9, "line": 29}}}}, "range": {"end": {"column": 75, "line": 29}, "start": {"column": 9, "line": 29}}}], "stringLiteralExprs": [{"range": {"end": {"column": 53, "line": 29}, "start": {"column": 16, "line": 29}}, "segments": [{"stringSegment": {"content": "Make it easy to add voice shortcuts", "range": {"end": {"column": 52, "line": 29}, "start": {"column": 17, "line": 29}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 30}, "start": {"column": 9, "line": 30}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 46, "line": 30}, "start": {"column": 14, "line": 30}}, "segments": [{"stringSegment": {"content": "Use this to ADD VOICE SHORTCUT", "range": {"end": {"column": 45, "line": 30}, "start": {"column": 15, "line": 30}}}}]}}, "range": {"end": {"column": 46, "line": 30}, "start": {"column": 14, "line": 30}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 30}, "start": {"column": 9, "line": 30}}}}, "range": {"end": {"column": 47, "line": 30}, "start": {"column": 9, "line": 30}}}], "stringLiteralExprs": [{"range": {"end": {"column": 46, "line": 30}, "start": {"column": 14, "line": 30}}, "segments": [{"stringSegment": {"content": "Use this to ADD VOICE SHORTCUT", "range": {"end": {"column": 45, "line": 30}, "start": {"column": 15, "line": 30}}}}]}]},
]

# Parser output for `routine.help("make a voice command for the morning routine")` at 34:8.
warns_for_help_member_make_voice_command_lowercase_substring_node := {"declReferenceExprs": [{"baseName": "routine", "range": {"end": {"column": 15, "line": 34}, "start": {"column": 8, "line": 34}}}, {"baseName": "help", "range": {"end": {"column": 20, "line": 34}, "start": {"column": 16, "line": 34}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 67, "line": 34}, "start": {"column": 21, "line": 34}}, "segments": [{"stringSegment": {"content": "make a voice command for the morning routine", "range": {"end": {"column": 66, "line": 34}, "start": {"column": 22, "line": 34}}}}]}}, "range": {"end": {"column": 67, "line": 34}, "start": {"column": 21, "line": 34}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "routine", "range": {"end": {"column": 15, "line": 34}, "start": {"column": 8, "line": 34}}}}, "declName": {"baseName": "help", "range": {"end": {"column": 20, "line": 34}, "start": {"column": 16, "line": 34}}}, "range": {"end": {"column": 20, "line": 34}, "start": {"column": 8, "line": 34}}}}, "range": {"end": {"column": 68, "line": 34}, "start": {"column": 8, "line": 34}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "routine", "range": {"end": {"column": 15, "line": 34}, "start": {"column": 8, "line": 34}}}}, "declName": {"baseName": "help", "range": {"end": {"column": 20, "line": 34}, "start": {"column": 16, "line": 34}}}, "range": {"end": {"column": 20, "line": 34}, "start": {"column": 8, "line": 34}}}], "stringLiteralExprs": [{"range": {"end": {"column": 67, "line": 34}, "start": {"column": 21, "line": 34}}, "segments": [{"stringSegment": {"content": "make a voice command for the morning routine", "range": {"end": {"column": 66, "line": 34}, "start": {"column": 22, "line": 34}}}}]}]}

# Parser output for `TextField("create a voice prompt before saving", text: $prompt)` at 47:19.
warns_for_textfield_create_voice_prompt_lowercase_substring_node := {"declReferenceExprs": [{"baseName": "TextField", "range": {"end": {"column": 28, "line": 47}, "start": {"column": 19, "line": 47}}}, {"baseName": "$prompt", "range": {"end": {"column": 81, "line": 47}, "start": {"column": 74, "line": 47}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 66, "line": 47}, "start": {"column": 29, "line": 47}}, "segments": [{"stringSegment": {"content": "create a voice prompt before saving", "range": {"end": {"column": 65, "line": 47}, "start": {"column": 30, "line": 47}}}}]}}, "range": {"end": {"column": 67, "line": 47}, "start": {"column": 29, "line": 47}}}, {"expression": {"declReferenceExpr": {"baseName": "$prompt", "range": {"end": {"column": 81, "line": 47}, "start": {"column": 74, "line": 47}}}}, "label": "text", "range": {"end": {"column": 81, "line": 47}, "start": {"column": 68, "line": 47}}}], "calledExpression": {"declReferenceExpr": {"baseName": "TextField", "range": {"end": {"column": 28, "line": 47}, "start": {"column": 19, "line": 47}}}}, "range": {"end": {"column": 82, "line": 47}, "start": {"column": 19, "line": 47}}}], "stringLiteralExprs": [{"range": {"end": {"column": 66, "line": 47}, "start": {"column": 29, "line": 47}}, "segments": [{"stringSegment": {"content": "create a voice prompt before saving", "range": {"end": {"column": 65, "line": 47}, "start": {"column": 30, "line": 47}}}}]}]}

# Parser output for `Button("Add to Shortcuts", action: addShortcut)` at 58:12.
does_not_warn_for_non_matching_visible_string_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 18, "line": 58}, "start": {"column": 12, "line": 58}}}, {"baseName": "addShortcut", "range": {"end": {"column": 58, "line": 58}, "start": {"column": 47, "line": 58}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 37, "line": 58}, "start": {"column": 19, "line": 58}}, "segments": [{"stringSegment": {"content": "Add to Shortcuts", "range": {"end": {"column": 36, "line": 58}, "start": {"column": 20, "line": 58}}}}]}}, "range": {"end": {"column": 38, "line": 58}, "start": {"column": 19, "line": 58}}}, {"expression": {"declReferenceExpr": {"baseName": "addShortcut", "range": {"end": {"column": 58, "line": 58}, "start": {"column": 47, "line": 58}}}}, "label": "action", "range": {"end": {"column": 58, "line": 58}, "start": {"column": 39, "line": 58}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 18, "line": 58}, "start": {"column": 12, "line": 58}}}}, "range": {"end": {"column": 59, "line": 58}, "start": {"column": 12, "line": 58}}}], "stringLiteralExprs": [{"range": {"end": {"column": 37, "line": 58}, "start": {"column": 19, "line": 58}}, "segments": [{"stringSegment": {"content": "Add to Shortcuts", "range": {"end": {"column": 36, "line": 58}, "start": {"column": 20, "line": 58}}}}]}]}

# Parser output for `IntentDescription("add voice shortcut")` at 66:10.
does_not_warn_for_non_visible_call_with_matching_string_node := {"declReferenceExprs": [{"baseName": "IntentDescription", "range": {"end": {"column": 27, "line": 66}, "start": {"column": 10, "line": 66}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 48, "line": 66}, "start": {"column": 28, "line": 66}}, "segments": [{"stringSegment": {"content": "add voice shortcut", "range": {"end": {"column": 47, "line": 66}, "start": {"column": 29, "line": 66}}}}]}}, "range": {"end": {"column": 48, "line": 66}, "start": {"column": 28, "line": 66}}}], "calledExpression": {"declReferenceExpr": {"baseName": "IntentDescription", "range": {"end": {"column": 27, "line": 66}, "start": {"column": 10, "line": 66}}}}, "range": {"end": {"column": 49, "line": 66}, "start": {"column": 10, "line": 66}}}], "stringLiteralExprs": [{"range": {"end": {"column": 48, "line": 66}, "start": {"column": 28, "line": 66}}, "segments": [{"stringSegment": {"content": "add voice shortcut", "range": {"end": {"column": 47, "line": 66}, "start": {"column": 29, "line": 66}}}}]}]}
