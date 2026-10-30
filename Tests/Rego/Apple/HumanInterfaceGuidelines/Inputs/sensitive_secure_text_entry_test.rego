package apple.hig.inputs.sensitive_secure_text_entry

test_warns_for_password_textfield_swift_syntax if {
  result := decision with input as warns_for_password_textfield_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.inputs.review_sensitive_secure_text_entry"
  result.warn[0].message == "Review sensitive text entry; use SecureField or secure text entry for passwords, passcodes, PINs, security codes, and CVV values."
  result.warn[0].line == 19
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_warns_for_sensitive_textfield_variants if {
  result := {"warn": [warning |
    node := warns_for_sensitive_textfield_variants_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 3
  result.warn[_].rule_id == "apple.hig.inputs.review_sensitive_secure_text_entry"
}

test_does_not_warn_for_securefield_password_swift_syntax if {
  result := decision with input as does_not_warn_for_securefield_password_swift_syntax_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_sensitive_textfield_swift_syntax if {
  result := decision with input as does_not_warn_for_non_sensitive_textfield_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `TextField("Password", text: $password)` at 19:11.
warns_for_password_textfield_swift_syntax_node := {"declReferenceExprs": [{"baseName": "TextField", "range": {"end": {"column": 20, "line": 19}, "start": {"column": 11, "line": 19}}}, {"baseName": "$password", "range": {"end": {"column": 48, "line": 19}, "start": {"column": 39, "line": 19}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 31, "line": 19}, "start": {"column": 21, "line": 19}}, "segments": [{"stringSegment": {"content": "Password", "range": {"end": {"column": 30, "line": 19}, "start": {"column": 22, "line": 19}}}}]}}, "range": {"end": {"column": 32, "line": 19}, "start": {"column": 21, "line": 19}}}, {"expression": {"declReferenceExpr": {"baseName": "$password", "range": {"end": {"column": 48, "line": 19}, "start": {"column": 39, "line": 19}}}}, "label": "text", "range": {"end": {"column": 48, "line": 19}, "start": {"column": 33, "line": 19}}}], "calledExpression": {"declReferenceExpr": {"baseName": "TextField", "range": {"end": {"column": 20, "line": 19}, "start": {"column": 11, "line": 19}}}}, "range": {"end": {"column": 49, "line": 19}, "start": {"column": 11, "line": 19}}}], "stringLiteralExprs": [{"range": {"end": {"column": 31, "line": 19}, "start": {"column": 21, "line": 19}}, "segments": [{"stringSegment": {"content": "Password", "range": {"end": {"column": 30, "line": 19}, "start": {"column": 22, "line": 19}}}}]}]}

# Parser output for `TextField("Enter PIN", text: $pin)` at 21:13.
# Parser output for `TextField("CVV", text: $cvv)` at 35:13.
# Parser output for `TextField("Security code", text: $code)` at 42:13.
warns_for_sensitive_textfield_variants_nodes := [
  {"declReferenceExprs": [{"baseName": "TextField", "range": {"end": {"column": 22, "line": 21}, "start": {"column": 13, "line": 21}}}, {"baseName": "$pin", "range": {"end": {"column": 46, "line": 21}, "start": {"column": 42, "line": 21}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 34, "line": 21}, "start": {"column": 23, "line": 21}}, "segments": [{"stringSegment": {"content": "Enter PIN", "range": {"end": {"column": 33, "line": 21}, "start": {"column": 24, "line": 21}}}}]}}, "range": {"end": {"column": 35, "line": 21}, "start": {"column": 23, "line": 21}}}, {"expression": {"declReferenceExpr": {"baseName": "$pin", "range": {"end": {"column": 46, "line": 21}, "start": {"column": 42, "line": 21}}}}, "label": "text", "range": {"end": {"column": 46, "line": 21}, "start": {"column": 36, "line": 21}}}], "calledExpression": {"declReferenceExpr": {"baseName": "TextField", "range": {"end": {"column": 22, "line": 21}, "start": {"column": 13, "line": 21}}}}, "range": {"end": {"column": 47, "line": 21}, "start": {"column": 13, "line": 21}}}], "stringLiteralExprs": [{"range": {"end": {"column": 34, "line": 21}, "start": {"column": 23, "line": 21}}, "segments": [{"stringSegment": {"content": "Enter PIN", "range": {"end": {"column": 33, "line": 21}, "start": {"column": 24, "line": 21}}}}]}]},
  {"declReferenceExprs": [{"baseName": "TextField", "range": {"end": {"column": 22, "line": 35}, "start": {"column": 13, "line": 35}}}, {"baseName": "$cvv", "range": {"end": {"column": 40, "line": 35}, "start": {"column": 36, "line": 35}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 28, "line": 35}, "start": {"column": 23, "line": 35}}, "segments": [{"stringSegment": {"content": "CVV", "range": {"end": {"column": 27, "line": 35}, "start": {"column": 24, "line": 35}}}}]}}, "range": {"end": {"column": 29, "line": 35}, "start": {"column": 23, "line": 35}}}, {"expression": {"declReferenceExpr": {"baseName": "$cvv", "range": {"end": {"column": 40, "line": 35}, "start": {"column": 36, "line": 35}}}}, "label": "text", "range": {"end": {"column": 40, "line": 35}, "start": {"column": 30, "line": 35}}}], "calledExpression": {"declReferenceExpr": {"baseName": "TextField", "range": {"end": {"column": 22, "line": 35}, "start": {"column": 13, "line": 35}}}}, "range": {"end": {"column": 41, "line": 35}, "start": {"column": 13, "line": 35}}}], "stringLiteralExprs": [{"range": {"end": {"column": 28, "line": 35}, "start": {"column": 23, "line": 35}}, "segments": [{"stringSegment": {"content": "CVV", "range": {"end": {"column": 27, "line": 35}, "start": {"column": 24, "line": 35}}}}]}]},
  {"declReferenceExprs": [{"baseName": "TextField", "range": {"end": {"column": 22, "line": 42}, "start": {"column": 13, "line": 42}}}, {"baseName": "$code", "range": {"end": {"column": 51, "line": 42}, "start": {"column": 46, "line": 42}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 38, "line": 42}, "start": {"column": 23, "line": 42}}, "segments": [{"stringSegment": {"content": "Security code", "range": {"end": {"column": 37, "line": 42}, "start": {"column": 24, "line": 42}}}}]}}, "range": {"end": {"column": 39, "line": 42}, "start": {"column": 23, "line": 42}}}, {"expression": {"declReferenceExpr": {"baseName": "$code", "range": {"end": {"column": 51, "line": 42}, "start": {"column": 46, "line": 42}}}}, "label": "text", "range": {"end": {"column": 51, "line": 42}, "start": {"column": 40, "line": 42}}}], "calledExpression": {"declReferenceExpr": {"baseName": "TextField", "range": {"end": {"column": 22, "line": 42}, "start": {"column": 13, "line": 42}}}}, "range": {"end": {"column": 52, "line": 42}, "start": {"column": 13, "line": 42}}}], "stringLiteralExprs": [{"range": {"end": {"column": 38, "line": 42}, "start": {"column": 23, "line": 42}}, "segments": [{"stringSegment": {"content": "Security code", "range": {"end": {"column": 37, "line": 42}, "start": {"column": 24, "line": 42}}}}]}]},
]

# Parser output for `SecureField("Password", text: $password)` at 27:11.
does_not_warn_for_securefield_password_swift_syntax_node := {"declReferenceExprs": [{"baseName": "SecureField", "range": {"end": {"column": 22, "line": 27}, "start": {"column": 11, "line": 27}}}, {"baseName": "$password", "range": {"end": {"column": 50, "line": 27}, "start": {"column": 41, "line": 27}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 33, "line": 27}, "start": {"column": 23, "line": 27}}, "segments": [{"stringSegment": {"content": "Password", "range": {"end": {"column": 32, "line": 27}, "start": {"column": 24, "line": 27}}}}]}}, "range": {"end": {"column": 34, "line": 27}, "start": {"column": 23, "line": 27}}}, {"expression": {"declReferenceExpr": {"baseName": "$password", "range": {"end": {"column": 50, "line": 27}, "start": {"column": 41, "line": 27}}}}, "label": "text", "range": {"end": {"column": 50, "line": 27}, "start": {"column": 35, "line": 27}}}], "calledExpression": {"declReferenceExpr": {"baseName": "SecureField", "range": {"end": {"column": 22, "line": 27}, "start": {"column": 11, "line": 27}}}}, "range": {"end": {"column": 51, "line": 27}, "start": {"column": 11, "line": 27}}}], "stringLiteralExprs": [{"range": {"end": {"column": 33, "line": 27}, "start": {"column": 23, "line": 27}}, "segments": [{"stringSegment": {"content": "Password", "range": {"end": {"column": 32, "line": 27}, "start": {"column": 24, "line": 27}}}}]}]}

# Parser output for `TextField("Display name", text: $name)` at 16:11.
does_not_warn_for_non_sensitive_textfield_swift_syntax_node := {"declReferenceExprs": [{"baseName": "TextField", "range": {"end": {"column": 20, "line": 16}, "start": {"column": 11, "line": 16}}}, {"baseName": "$name", "range": {"end": {"column": 48, "line": 16}, "start": {"column": 43, "line": 16}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 35, "line": 16}, "start": {"column": 21, "line": 16}}, "segments": [{"stringSegment": {"content": "Display name", "range": {"end": {"column": 34, "line": 16}, "start": {"column": 22, "line": 16}}}}]}}, "range": {"end": {"column": 36, "line": 16}, "start": {"column": 21, "line": 16}}}, {"expression": {"declReferenceExpr": {"baseName": "$name", "range": {"end": {"column": 48, "line": 16}, "start": {"column": 43, "line": 16}}}}, "label": "text", "range": {"end": {"column": 48, "line": 16}, "start": {"column": 37, "line": 16}}}], "calledExpression": {"declReferenceExpr": {"baseName": "TextField", "range": {"end": {"column": 20, "line": 16}, "start": {"column": 11, "line": 16}}}}, "range": {"end": {"column": 49, "line": 16}, "start": {"column": 11, "line": 16}}}], "stringLiteralExprs": [{"range": {"end": {"column": 35, "line": 16}, "start": {"column": 21, "line": 16}}, "segments": [{"stringSegment": {"content": "Display name", "range": {"end": {"column": 34, "line": 16}, "start": {"column": 22, "line": 16}}}}]}]}
