package semantickit.design_guidelines.no_dictionary_boundary_plumbing

test_warns_for_dictionary_payload_assembly_in_sources if {
  result := decision with input as dictionary_payload_assembly_node

  count(result.warn) == 1
  result.warn[0].rule_id == "semantickit.design_guidelines.no_dictionary_boundary_plumbing"
  result.warn[0].message == "Decode dictionary-shaped data at the boundary into typed models; do not let generic dictionary plumbing become implementation behavior."
  result.warn[0].line == 42
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_warns_for_dictionary_transform_in_sources if {
  result := decision with input as dictionary_transform_node

  count(result.warn) == 1
  result.warn[0].rule_id == "semantickit.design_guidelines.no_dictionary_boundary_plumbing"
  result.warn[0].line == 9
  result.warn[0].column == 18
}

test_warns_for_dictionary_key_string_plumbing_in_sources if {
  result := decision with input as dictionary_key_string_plumbing_node

  count(result.warn) == 1
  result.warn[0].rule_id == "semantickit.design_guidelines.no_dictionary_boundary_plumbing"
}

test_does_not_warn_for_typed_json_decode_boundary if {
  result := decision with input as typed_json_decode_boundary_node

  count(result.warn) == 0
}

# Parser output for `Dictionary(uniqueKeysWithValues: [("rule_id", ruleID), ("message", message), ("severity", severity)])` at 42:13.
dictionary_payload_assembly_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 114}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 23}}, "token": {"kind": "identifier", "text": "Dictionary"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 23}, "end": {"line": 42, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 113}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 113}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 44}}, "token": {"kind": "identifier", "text": "uniqueKeysWithValues"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 44}, "end": {"line": 42, "column": 45}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "ArrayExprSyntax", "range": {"start": {"line": 42, "column": 46}, "end": {"line": 42, "column": 113}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 46}, "end": {"line": 42, "column": 47}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
        {"type": "ArrayElementListSyntax", "range": {"start": {"line": 42, "column": 47}, "end": {"line": 42, "column": 112}}, "children": [
          {"type": "ArrayElementSyntax", "range": {"start": {"line": 42, "column": 47}, "end": {"line": 42, "column": 67}}, "children": [
            {"type": "TupleExprSyntax", "range": {"start": {"line": 42, "column": 47}, "end": {"line": 42, "column": 66}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 47}, "end": {"line": 42, "column": 48}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
              {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 48}, "end": {"line": 42, "column": 65}}, "children": [
                {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 48}, "end": {"line": 42, "column": 58}}, "children": [
                  {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 48}, "end": {"line": 42, "column": 57}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 48}, "end": {"line": 42, "column": 49}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                    {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 49}, "end": {"line": 42, "column": 56}}, "children": [
                      {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 49}, "end": {"line": 42, "column": 56}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 49}, "end": {"line": 42, "column": 56}}, "token": {"kind": "stringSegment", "text": "rule_id"}, "children": []},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 56}, "end": {"line": 42, "column": 57}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 57}, "end": {"line": 42, "column": 58}}, "token": {"kind": "comma", "text": ","}, "children": []},
                ]},
                {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 59}, "end": {"line": 42, "column": 65}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 59}, "end": {"line": 42, "column": 65}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 59}, "end": {"line": 42, "column": 65}}, "token": {"kind": "identifier", "text": "ruleID"}, "children": []},
                  ]},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 65}, "end": {"line": 42, "column": 66}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 66}, "end": {"line": 42, "column": 67}}, "token": {"kind": "comma", "text": ","}, "children": []},
          ]},
          {"type": "ArrayElementSyntax", "range": {"start": {"line": 42, "column": 68}, "end": {"line": 42, "column": 89}}, "children": [
            {"type": "TupleExprSyntax", "range": {"start": {"line": 42, "column": 68}, "end": {"line": 42, "column": 88}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 68}, "end": {"line": 42, "column": 69}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
              {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 69}, "end": {"line": 42, "column": 87}}, "children": [
                {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 69}, "end": {"line": 42, "column": 79}}, "children": [
                  {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 69}, "end": {"line": 42, "column": 78}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 69}, "end": {"line": 42, "column": 70}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                    {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 70}, "end": {"line": 42, "column": 77}}, "children": [
                      {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 70}, "end": {"line": 42, "column": 77}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 70}, "end": {"line": 42, "column": 77}}, "token": {"kind": "stringSegment", "text": "message"}, "children": []},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 77}, "end": {"line": 42, "column": 78}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 78}, "end": {"line": 42, "column": 79}}, "token": {"kind": "comma", "text": ","}, "children": []},
                ]},
                {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 80}, "end": {"line": 42, "column": 87}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 80}, "end": {"line": 42, "column": 87}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 80}, "end": {"line": 42, "column": 87}}, "token": {"kind": "identifier", "text": "message"}, "children": []},
                  ]},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 87}, "end": {"line": 42, "column": 88}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 88}, "end": {"line": 42, "column": 89}}, "token": {"kind": "comma", "text": ","}, "children": []},
          ]},
          {"type": "ArrayElementSyntax", "range": {"start": {"line": 42, "column": 90}, "end": {"line": 42, "column": 112}}, "children": [
            {"type": "TupleExprSyntax", "range": {"start": {"line": 42, "column": 90}, "end": {"line": 42, "column": 112}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 90}, "end": {"line": 42, "column": 91}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
              {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 91}, "end": {"line": 42, "column": 111}}, "children": [
                {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 91}, "end": {"line": 42, "column": 102}}, "children": [
                  {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 91}, "end": {"line": 42, "column": 101}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 91}, "end": {"line": 42, "column": 92}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                    {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 92}, "end": {"line": 42, "column": 100}}, "children": [
                      {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 92}, "end": {"line": 42, "column": 100}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 92}, "end": {"line": 42, "column": 100}}, "token": {"kind": "stringSegment", "text": "severity"}, "children": []},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 100}, "end": {"line": 42, "column": 101}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 101}, "end": {"line": 42, "column": 102}}, "token": {"kind": "comma", "text": ","}, "children": []},
                ]},
                {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 103}, "end": {"line": 42, "column": 111}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 103}, "end": {"line": 42, "column": 111}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 103}, "end": {"line": 42, "column": 111}}, "token": {"kind": "identifier", "text": "severity"}, "children": []},
                  ]},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 111}, "end": {"line": 42, "column": 112}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 112}, "end": {"line": 42, "column": 113}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 113}, "end": {"line": 42, "column": 114}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 114}, "end": {"line": 42, "column": 114}}, "children": []},
]}

# Parser output for `settings.mapValues { $0.description }` at 9:18.
dictionary_transform_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 9, "column": 18}, "end": {"line": 9, "column": 55}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 9, "column": 18}, "end": {"line": 9, "column": 36}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 9, "column": 18}, "end": {"line": 9, "column": 26}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 18}, "end": {"line": 9, "column": 26}}, "token": {"kind": "identifier", "text": "settings"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 26}, "end": {"line": 9, "column": 27}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 9, "column": 27}, "end": {"line": 9, "column": 36}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 27}, "end": {"line": 9, "column": 36}}, "token": {"kind": "identifier", "text": "mapValues"}, "children": []},
    ]},
  ]},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 9, "column": 37}, "end": {"line": 9, "column": 37}}, "children": []},
  {"type": "ClosureExprSyntax", "range": {"start": {"line": 9, "column": 37}, "end": {"line": 9, "column": 55}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 37}, "end": {"line": 9, "column": 38}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 9, "column": 39}, "end": {"line": 9, "column": 53}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 9, "column": 39}, "end": {"line": 9, "column": 53}}, "children": [
        {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 9, "column": 39}, "end": {"line": 9, "column": 53}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 9, "column": 39}, "end": {"line": 9, "column": 41}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 39}, "end": {"line": 9, "column": 41}}, "token": {"kind": "dollarIdentifier", "text": "$0"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 41}, "end": {"line": 9, "column": 42}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 9, "column": 42}, "end": {"line": 9, "column": 53}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 42}, "end": {"line": 9, "column": 53}}, "token": {"kind": "identifier", "text": "description"}, "children": []},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 54}, "end": {"line": 9, "column": 55}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 9, "column": 55}, "end": {"line": 9, "column": 55}}, "children": []},
]}

# Parser output for `payload.append("message_id")` at 21:7.
dictionary_key_string_plumbing_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 21, "column": 7}, "end": {"line": 21, "column": 35}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 21, "column": 7}, "end": {"line": 21, "column": 21}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 21, "column": 7}, "end": {"line": 21, "column": 14}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 7}, "end": {"line": 21, "column": 14}}, "token": {"kind": "identifier", "text": "payload"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 14}, "end": {"line": 21, "column": 15}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 21}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 21}}, "token": {"kind": "identifier", "text": "append"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 21}, "end": {"line": 21, "column": 22}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 21, "column": 22}, "end": {"line": 21, "column": 34}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 21, "column": 22}, "end": {"line": 21, "column": 34}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 21, "column": 22}, "end": {"line": 21, "column": 34}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 22}, "end": {"line": 21, "column": 23}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 21, "column": 23}, "end": {"line": 21, "column": 33}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 21, "column": 23}, "end": {"line": 21, "column": 33}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 23}, "end": {"line": 21, "column": 33}}, "token": {"kind": "stringSegment", "text": "message_id"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 33}, "end": {"line": 21, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 34}, "end": {"line": 21, "column": 35}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 21, "column": 35}, "end": {"line": 21, "column": 35}}, "children": []},
]}

# Parser output for `JSONDecoder().decode(RemotePayload.self, from: message_id)` at 27:11.
typed_json_decode_boundary_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 27, "column": 11}, "end": {"line": 27, "column": 69}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 27, "column": 11}, "end": {"line": 27, "column": 31}}, "children": [
    {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 27, "column": 11}, "end": {"line": 27, "column": 24}}, "children": [
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 11}, "end": {"line": 27, "column": 22}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 11}, "end": {"line": 27, "column": 22}}, "token": {"kind": "identifier", "text": "JSONDecoder"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 22}, "end": {"line": 27, "column": 23}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "LabeledExprListSyntax", "range": {"start": {"line": 27, "column": 23}, "end": {"line": 27, "column": 23}}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 23}, "end": {"line": 27, "column": 24}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
      {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 27, "column": 24}, "end": {"line": 27, "column": 24}}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 24}, "end": {"line": 27, "column": 25}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 25}, "end": {"line": 27, "column": 31}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 25}, "end": {"line": 27, "column": 31}}, "token": {"kind": "identifier", "text": "decode"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 31}, "end": {"line": 27, "column": 32}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 27, "column": 32}, "end": {"line": 27, "column": 68}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 27, "column": 32}, "end": {"line": 27, "column": 51}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 27, "column": 32}, "end": {"line": 27, "column": 50}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 32}, "end": {"line": 27, "column": 45}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 32}, "end": {"line": 27, "column": 45}}, "token": {"kind": "identifier", "text": "RemotePayload"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 45}, "end": {"line": 27, "column": 46}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 46}, "end": {"line": 27, "column": 50}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 46}, "end": {"line": 27, "column": 50}}, "token": {"kind": "keyword", "text": "self"}, "children": []},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 50}, "end": {"line": 27, "column": 51}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 27, "column": 52}, "end": {"line": 27, "column": 68}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 52}, "end": {"line": 27, "column": 56}}, "token": {"kind": "identifier", "text": "from"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 56}, "end": {"line": 27, "column": 57}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 58}, "end": {"line": 27, "column": 68}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 58}, "end": {"line": 27, "column": 68}}, "token": {"kind": "identifier", "text": "message_id"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 68}, "end": {"line": 27, "column": 69}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 27, "column": 69}, "end": {"line": 27, "column": 69}}, "children": []},
]}
