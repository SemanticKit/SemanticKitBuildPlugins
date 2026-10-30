package apple.hig.identity.sign_in_with_apple_button

test_warns_for_custom_button_with_sign_in_with_apple_text if {
  result := decision with input as warns_for_custom_button_with_sign_in_with_apple_text_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.identity.review_custom_sign_in_with_apple_button"
  result.warn[0].message == "Review Sign in with Apple control; prefer the system-provided button API."
  result.warn[0].line == 42
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_asauthorizationappleidbutton if {
  result := decision with input as does_not_warn_for_asauthorizationappleidbutton_node

  count(result.warn) == 0
}

# Parser output for `Button("Sign in with Apple", action: signIn)` at 42:13.
warns_for_custom_button_with_sign_in_with_apple_text_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 19, "line": 42}, "start": {"column": 13, "line": 42}}}, {"baseName": "signIn", "range": {"end": {"column": 56, "line": 42}, "start": {"column": 50, "line": 42}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 40, "line": 42}, "start": {"column": 20, "line": 42}}, "segments": [{"stringSegment": {"content": "Sign in with Apple", "range": {"end": {"column": 39, "line": 42}, "start": {"column": 21, "line": 42}}}}]}}, "range": {"end": {"column": 41, "line": 42}, "start": {"column": 20, "line": 42}}}, {"expression": {"declReferenceExpr": {"baseName": "signIn", "range": {"end": {"column": 56, "line": 42}, "start": {"column": 50, "line": 42}}}}, "label": "action", "range": {"end": {"column": 56, "line": 42}, "start": {"column": 42, "line": 42}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 19, "line": 42}, "start": {"column": 13, "line": 42}}}}, "range": {"end": {"column": 57, "line": 42}, "start": {"column": 13, "line": 42}}}], "stringLiteralExprs": [{"range": {"end": {"column": 40, "line": 42}, "start": {"column": 20, "line": 42}}, "segments": [{"stringSegment": {"content": "Sign in with Apple", "range": {"end": {"column": 39, "line": 42}, "start": {"column": 21, "line": 42}}}}]}]}

# Parser output for `ASAuthorizationAppleIDButton("Sign in with Apple")` at 55:9.
does_not_warn_for_asauthorizationappleidbutton_node := {"declReferenceExprs": [{"baseName": "ASAuthorizationAppleIDButton", "range": {"end": {"column": 37, "line": 55}, "start": {"column": 9, "line": 55}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 58, "line": 55}, "start": {"column": 38, "line": 55}}, "segments": [{"stringSegment": {"content": "Sign in with Apple", "range": {"end": {"column": 57, "line": 55}, "start": {"column": 39, "line": 55}}}}]}}, "range": {"end": {"column": 58, "line": 55}, "start": {"column": 38, "line": 55}}}], "calledExpression": {"declReferenceExpr": {"baseName": "ASAuthorizationAppleIDButton", "range": {"end": {"column": 37, "line": 55}, "start": {"column": 9, "line": 55}}}}, "range": {"end": {"column": 59, "line": 55}, "start": {"column": 9, "line": 55}}}], "stringLiteralExprs": [{"range": {"end": {"column": 58, "line": 55}, "start": {"column": 38, "line": 55}}, "segments": [{"stringSegment": {"content": "Sign in with Apple", "range": {"end": {"column": 57, "line": 55}, "start": {"column": 39, "line": 55}}}}]}]}
