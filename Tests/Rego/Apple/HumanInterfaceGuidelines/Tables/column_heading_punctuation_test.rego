package apple.hig.tables.column_heading_punctuation

test_warns_for_table_column_heading_with_trailing_colon if {
  result := decision with input as warns_for_table_column_heading_with_trailing_colon_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tables.review_column_heading_trailing_colon"
  result.warn[0].message == "Review table column heading; column headings should avoid trailing punctuation such as a colon."
  result.warn[0].line == 18
  result.warn[0].column == 7
  result.warn[0].severity == "warning"
}

test_warns_for_table_column_heading_with_sentence_punctuation if {
  result := decision with input as warns_for_table_column_heading_with_sentence_punctuation_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tables.review_column_heading_sentence_punctuation"
  result.warn[0].message == "Review table column heading; use a short noun or noun phrase without ending punctuation."
  result.warn[0].line == 24
  result.warn[0].column == 7
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_table_column_heading_without_punctuation if {
  result := decision with input as does_not_warn_for_table_column_heading_without_punctuation_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_table_column_visible_string if {
  result := decision with input as does_not_warn_for_non_table_column_visible_string_node

  count(result.warn) == 0
}

# Parser output for `TableColumn("Status:", value: \.status)` at 18:7.
warns_for_table_column_heading_with_trailing_colon_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 46}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 18}}, "token": {"kind": "identifier", "text": "TableColumn"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 45}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 29}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 28}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 20}, "end": {"line": 18, "column": 27}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 20}, "end": {"line": 18, "column": 27}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 20}, "end": {"line": 18, "column": 27}}, "token": {"kind": "stringSegment", "text": "Status:"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 27}, "end": {"line": 18, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 28}, "end": {"line": 18, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 30}, "end": {"line": 18, "column": 45}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 30}, "end": {"line": 18, "column": 35}}, "token": {"kind": "identifier", "text": "value"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 35}, "end": {"line": 18, "column": 36}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "KeyPathExprSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 45}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 38}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
        {"type": "KeyPathComponentListSyntax", "range": {"start": {"line": 18, "column": 38}, "end": {"line": 18, "column": 45}}, "children": [
          {"type": "KeyPathComponentSyntax", "range": {"start": {"line": 18, "column": 38}, "end": {"line": 18, "column": 45}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 38}, "end": {"line": 18, "column": 39}}, "token": {"kind": "period", "text": "."}, "children": []},
            {"type": "KeyPathPropertyComponentSyntax", "range": {"start": {"line": 18, "column": 39}, "end": {"line": 18, "column": 45}}, "children": [
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 39}, "end": {"line": 18, "column": 45}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 39}, "end": {"line": 18, "column": 45}}, "token": {"kind": "identifier", "text": "status"}, "children": []},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 45}, "end": {"line": 18, "column": 46}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 46}, "end": {"line": 18, "column": 46}}, "children": []},
]}

# Parser output for `TableColumn("Delivery date.", value: \.deliveryDate)` at 24:7.
warns_for_table_column_heading_with_sentence_punctuation_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 7}, "end": {"line": 24, "column": 59}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 7}, "end": {"line": 24, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 7}, "end": {"line": 24, "column": 18}}, "token": {"kind": "identifier", "text": "TableColumn"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 18}, "end": {"line": 24, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 19}, "end": {"line": 24, "column": 58}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 19}, "end": {"line": 24, "column": 36}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 19}, "end": {"line": 24, "column": 35}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 19}, "end": {"line": 24, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 34}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 34}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 34}}, "token": {"kind": "stringSegment", "text": "Delivery date."}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 34}, "end": {"line": 24, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 35}, "end": {"line": 24, "column": 36}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 37}, "end": {"line": 24, "column": 58}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 37}, "end": {"line": 24, "column": 42}}, "token": {"kind": "identifier", "text": "value"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 42}, "end": {"line": 24, "column": 43}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "KeyPathExprSyntax", "range": {"start": {"line": 24, "column": 44}, "end": {"line": 24, "column": 58}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 44}, "end": {"line": 24, "column": 45}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
        {"type": "KeyPathComponentListSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 58}}, "children": [
          {"type": "KeyPathComponentSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 58}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 46}}, "token": {"kind": "period", "text": "."}, "children": []},
            {"type": "KeyPathPropertyComponentSyntax", "range": {"start": {"line": 24, "column": 46}, "end": {"line": 24, "column": 58}}, "children": [
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 46}, "end": {"line": 24, "column": 58}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 46}, "end": {"line": 24, "column": 58}}, "token": {"kind": "identifier", "text": "deliveryDate"}, "children": []},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 58}, "end": {"line": 24, "column": 59}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 59}, "end": {"line": 24, "column": 59}}, "children": []},
]}

# Parser output for `TableColumn("Delivery date", value: \.deliveryDate)` at 30:7.
does_not_warn_for_table_column_heading_without_punctuation_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 30, "column": 7}, "end": {"line": 30, "column": 58}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 7}, "end": {"line": 30, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 7}, "end": {"line": 30, "column": 18}}, "token": {"kind": "identifier", "text": "TableColumn"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 18}, "end": {"line": 30, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 30, "column": 19}, "end": {"line": 30, "column": 57}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 30, "column": 19}, "end": {"line": 30, "column": 35}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 30, "column": 19}, "end": {"line": 30, "column": 34}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 19}, "end": {"line": 30, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 33}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 33}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 33}}, "token": {"kind": "stringSegment", "text": "Delivery date"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 33}, "end": {"line": 30, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 34}, "end": {"line": 30, "column": 35}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 30, "column": 36}, "end": {"line": 30, "column": 57}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 36}, "end": {"line": 30, "column": 41}}, "token": {"kind": "identifier", "text": "value"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 41}, "end": {"line": 30, "column": 42}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "KeyPathExprSyntax", "range": {"start": {"line": 30, "column": 43}, "end": {"line": 30, "column": 57}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 43}, "end": {"line": 30, "column": 44}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
        {"type": "KeyPathComponentListSyntax", "range": {"start": {"line": 30, "column": 44}, "end": {"line": 30, "column": 57}}, "children": [
          {"type": "KeyPathComponentSyntax", "range": {"start": {"line": 30, "column": 44}, "end": {"line": 30, "column": 57}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 44}, "end": {"line": 30, "column": 45}}, "token": {"kind": "period", "text": "."}, "children": []},
            {"type": "KeyPathPropertyComponentSyntax", "range": {"start": {"line": 30, "column": 45}, "end": {"line": 30, "column": 57}}, "children": [
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 45}, "end": {"line": 30, "column": 57}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 45}, "end": {"line": 30, "column": 57}}, "token": {"kind": "identifier", "text": "deliveryDate"}, "children": []},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 57}, "end": {"line": 30, "column": 58}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 30, "column": 58}, "end": {"line": 30, "column": 58}}, "children": []},
]}

# Parser output for `Text("Status:")` at 42:11.
does_not_warn_for_non_table_column_visible_string_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 26}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 15}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 15}, "end": {"line": 42, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 16}, "end": {"line": 42, "column": 25}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 16}, "end": {"line": 42, "column": 25}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 16}, "end": {"line": 42, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 16}, "end": {"line": 42, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 17}, "end": {"line": 42, "column": 24}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 17}, "end": {"line": 42, "column": 24}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 17}, "end": {"line": 42, "column": 24}}, "token": {"kind": "stringSegment", "text": "Status:"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 25}, "end": {"line": 42, "column": 26}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 26}, "end": {"line": 42, "column": 26}}, "children": []},
]}
