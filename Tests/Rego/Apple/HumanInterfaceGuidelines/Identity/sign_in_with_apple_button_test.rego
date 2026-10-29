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
warns_for_custom_button_with_sign_in_with_apple_text_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 57}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 19}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 19}, "end": {"line": 42, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 20}, "end": {"line": 42, "column": 56}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 20}, "end": {"line": 42, "column": 41}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 20}, "end": {"line": 42, "column": 40}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 20}, "end": {"line": 42, "column": 21}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 21}, "end": {"line": 42, "column": 39}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 21}, "end": {"line": 42, "column": 39}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 21}, "end": {"line": 42, "column": 39}}, "token": {"kind": "stringSegment", "text": "Sign in with Apple"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 39}, "end": {"line": 42, "column": 40}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 40}, "end": {"line": 42, "column": 41}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 42}, "end": {"line": 42, "column": 56}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 42}, "end": {"line": 42, "column": 48}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 48}, "end": {"line": 42, "column": 49}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 50}, "end": {"line": 42, "column": 56}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 50}, "end": {"line": 42, "column": 56}}, "token": {"kind": "identifier", "text": "signIn"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 56}, "end": {"line": 42, "column": 57}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 57}, "end": {"line": 42, "column": 57}}, "children": []},
]}

# Parser output for `ASAuthorizationAppleIDButton("Sign in with Apple")` at 55:9.
does_not_warn_for_asauthorizationappleidbutton_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 55, "column": 9}, "end": {"line": 55, "column": 59}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 55, "column": 9}, "end": {"line": 55, "column": 37}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 55, "column": 9}, "end": {"line": 55, "column": 37}}, "token": {"kind": "identifier", "text": "ASAuthorizationAppleIDButton"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 55, "column": 37}, "end": {"line": 55, "column": 38}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 55, "column": 38}, "end": {"line": 55, "column": 58}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 55, "column": 38}, "end": {"line": 55, "column": 58}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 55, "column": 38}, "end": {"line": 55, "column": 58}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 55, "column": 38}, "end": {"line": 55, "column": 39}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 55, "column": 39}, "end": {"line": 55, "column": 57}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 55, "column": 39}, "end": {"line": 55, "column": 57}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 55, "column": 39}, "end": {"line": 55, "column": 57}}, "token": {"kind": "stringSegment", "text": "Sign in with Apple"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 55, "column": 57}, "end": {"line": 55, "column": 58}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 55, "column": 58}, "end": {"line": 55, "column": 59}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 55, "column": 59}, "end": {"line": 55, "column": 59}}, "children": []},
]}
