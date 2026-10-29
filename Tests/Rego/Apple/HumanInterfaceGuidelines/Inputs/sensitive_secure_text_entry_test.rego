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
warns_for_password_textfield_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 19, "column": 11}, "end": {"line": 19, "column": 49}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 19, "column": 11}, "end": {"line": 19, "column": 20}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 11}, "end": {"line": 19, "column": 20}}, "token": {"kind": "identifier", "text": "TextField"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 20}, "end": {"line": 19, "column": 21}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 19, "column": 21}, "end": {"line": 19, "column": 48}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 19, "column": 21}, "end": {"line": 19, "column": 32}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 19, "column": 21}, "end": {"line": 19, "column": 31}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 21}, "end": {"line": 19, "column": 22}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 19, "column": 22}, "end": {"line": 19, "column": 30}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 19, "column": 22}, "end": {"line": 19, "column": 30}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 22}, "end": {"line": 19, "column": 30}}, "token": {"kind": "stringSegment", "text": "Password"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 30}, "end": {"line": 19, "column": 31}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 31}, "end": {"line": 19, "column": 32}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 19, "column": 33}, "end": {"line": 19, "column": 48}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 33}, "end": {"line": 19, "column": 37}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 37}, "end": {"line": 19, "column": 38}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 19, "column": 39}, "end": {"line": 19, "column": 48}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 39}, "end": {"line": 19, "column": 48}}, "token": {"kind": "identifier", "text": "$password"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 48}, "end": {"line": 19, "column": 49}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 19, "column": 49}, "end": {"line": 19, "column": 49}}, "children": []},
]}

# Parser output for `TextField("Enter PIN", text: $pin)` at 21:13.
# Parser output for `TextField("CVV", text: $cvv)` at 35:13.
# Parser output for `TextField("Security code", text: $code)` at 42:13.
warns_for_sensitive_textfield_variants_nodes := [
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 21, "column": 13}, "end": {"line": 21, "column": 47}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 21, "column": 13}, "end": {"line": 21, "column": 22}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 13}, "end": {"line": 21, "column": 22}}, "token": {"kind": "identifier", "text": "TextField"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 22}, "end": {"line": 21, "column": 23}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 21, "column": 23}, "end": {"line": 21, "column": 46}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 21, "column": 23}, "end": {"line": 21, "column": 35}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 21, "column": 23}, "end": {"line": 21, "column": 34}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 23}, "end": {"line": 21, "column": 24}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 21, "column": 24}, "end": {"line": 21, "column": 33}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 21, "column": 24}, "end": {"line": 21, "column": 33}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 24}, "end": {"line": 21, "column": 33}}, "token": {"kind": "stringSegment", "text": "Enter PIN"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 33}, "end": {"line": 21, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 34}, "end": {"line": 21, "column": 35}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 21, "column": 36}, "end": {"line": 21, "column": 46}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 36}, "end": {"line": 21, "column": 40}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 40}, "end": {"line": 21, "column": 41}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 21, "column": 42}, "end": {"line": 21, "column": 46}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 42}, "end": {"line": 21, "column": 46}}, "token": {"kind": "identifier", "text": "$pin"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 46}, "end": {"line": 21, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 21, "column": 47}, "end": {"line": 21, "column": 47}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 35, "column": 13}, "end": {"line": 35, "column": 41}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 35, "column": 13}, "end": {"line": 35, "column": 22}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 13}, "end": {"line": 35, "column": 22}}, "token": {"kind": "identifier", "text": "TextField"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 22}, "end": {"line": 35, "column": 23}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 35, "column": 23}, "end": {"line": 35, "column": 40}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 35, "column": 23}, "end": {"line": 35, "column": 29}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 35, "column": 23}, "end": {"line": 35, "column": 28}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 23}, "end": {"line": 35, "column": 24}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 35, "column": 24}, "end": {"line": 35, "column": 27}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 35, "column": 24}, "end": {"line": 35, "column": 27}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 24}, "end": {"line": 35, "column": 27}}, "token": {"kind": "stringSegment", "text": "CVV"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 27}, "end": {"line": 35, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 28}, "end": {"line": 35, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 35, "column": 30}, "end": {"line": 35, "column": 40}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 30}, "end": {"line": 35, "column": 34}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 34}, "end": {"line": 35, "column": 35}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 35, "column": 36}, "end": {"line": 35, "column": 40}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 36}, "end": {"line": 35, "column": 40}}, "token": {"kind": "identifier", "text": "$cvv"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 40}, "end": {"line": 35, "column": 41}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 35, "column": 41}, "end": {"line": 35, "column": 41}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 52}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 22}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 22}}, "token": {"kind": "identifier", "text": "TextField"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 22}, "end": {"line": 42, "column": 23}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 23}, "end": {"line": 42, "column": 51}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 23}, "end": {"line": 42, "column": 39}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 23}, "end": {"line": 42, "column": 38}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 23}, "end": {"line": 42, "column": 24}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 37}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 37}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 37}}, "token": {"kind": "stringSegment", "text": "Security code"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 37}, "end": {"line": 42, "column": 38}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 38}, "end": {"line": 42, "column": 39}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 40}, "end": {"line": 42, "column": 51}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 40}, "end": {"line": 42, "column": 44}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 44}, "end": {"line": 42, "column": 45}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 46}, "end": {"line": 42, "column": 51}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 46}, "end": {"line": 42, "column": 51}}, "token": {"kind": "identifier", "text": "$code"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 51}, "end": {"line": 42, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 52}, "end": {"line": 42, "column": 52}}, "children": []},
  ]},
]

# Parser output for `SecureField("Password", text: $password)` at 27:11.
does_not_warn_for_securefield_password_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 27, "column": 11}, "end": {"line": 27, "column": 51}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 11}, "end": {"line": 27, "column": 22}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 11}, "end": {"line": 27, "column": 22}}, "token": {"kind": "identifier", "text": "SecureField"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 22}, "end": {"line": 27, "column": 23}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 27, "column": 23}, "end": {"line": 27, "column": 50}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 27, "column": 23}, "end": {"line": 27, "column": 34}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 27, "column": 23}, "end": {"line": 27, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 23}, "end": {"line": 27, "column": 24}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 27, "column": 24}, "end": {"line": 27, "column": 32}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 27, "column": 24}, "end": {"line": 27, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 24}, "end": {"line": 27, "column": 32}}, "token": {"kind": "stringSegment", "text": "Password"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 32}, "end": {"line": 27, "column": 33}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 33}, "end": {"line": 27, "column": 34}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 27, "column": 35}, "end": {"line": 27, "column": 50}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 35}, "end": {"line": 27, "column": 39}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 39}, "end": {"line": 27, "column": 40}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 41}, "end": {"line": 27, "column": 50}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 41}, "end": {"line": 27, "column": 50}}, "token": {"kind": "identifier", "text": "$password"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 50}, "end": {"line": 27, "column": 51}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 27, "column": 51}, "end": {"line": 27, "column": 51}}, "children": []},
]}

# Parser output for `TextField("Display name", text: $name)` at 16:11.
does_not_warn_for_non_sensitive_textfield_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 16, "column": 11}, "end": {"line": 16, "column": 49}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 11}, "end": {"line": 16, "column": 20}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 11}, "end": {"line": 16, "column": 20}}, "token": {"kind": "identifier", "text": "TextField"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 20}, "end": {"line": 16, "column": 21}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 16, "column": 21}, "end": {"line": 16, "column": 48}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 16, "column": 21}, "end": {"line": 16, "column": 36}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 16, "column": 21}, "end": {"line": 16, "column": 35}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 21}, "end": {"line": 16, "column": 22}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 16, "column": 22}, "end": {"line": 16, "column": 34}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 16, "column": 22}, "end": {"line": 16, "column": 34}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 22}, "end": {"line": 16, "column": 34}}, "token": {"kind": "stringSegment", "text": "Display name"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 34}, "end": {"line": 16, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 35}, "end": {"line": 16, "column": 36}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 16, "column": 37}, "end": {"line": 16, "column": 48}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 37}, "end": {"line": 16, "column": 41}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 41}, "end": {"line": 16, "column": 42}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 43}, "end": {"line": 16, "column": 48}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 43}, "end": {"line": 16, "column": 48}}, "token": {"kind": "identifier", "text": "$name"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 48}, "end": {"line": 16, "column": 49}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 16, "column": 49}, "end": {"line": 16, "column": 49}}, "children": []},
]}
