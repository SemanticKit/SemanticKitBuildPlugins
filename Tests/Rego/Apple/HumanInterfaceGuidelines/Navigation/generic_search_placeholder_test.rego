package apple.hig.navigation.generic_search_placeholder

test_warns_for_text_field_search_placeholder if {
  result := decision with input as warns_for_text_field_search_placeholder_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.navigation.review_generic_search_placeholder"
  result.warn[0].message == "Review search field placeholder; describe what people can search for instead of using generic Search text."
  result.warn[0].line == 14
  result.warn[0].column == 7
  result.warn[0].severity == "warning"
}

test_warns_for_searchable_member_search_placeholder if {
  result := decision with input as warns_for_searchable_member_search_placeholder_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.navigation.review_generic_search_placeholder"
  result.warn[0].line == 31
  result.warn[0].column == 5
}

test_warns_for_searchable_base_search_prompt if {
  result := decision with input as warns_for_searchable_base_search_prompt_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.navigation.review_generic_search_placeholder"
  result.warn[0].line == 37
  result.warn[0].column == 5
}

test_does_not_warn_for_descriptive_search_placeholder if {
  result := decision with input as does_not_warn_for_descriptive_search_placeholder_node

  count(result.warn) == 0
}

test_does_not_warn_for_searchable_search_without_prompt_label if {
  result := decision with input as does_not_warn_for_searchable_search_without_prompt_label_node

  count(result.warn) == 0
}

test_does_not_warn_for_generic_search_text_on_unrelated_call if {
  result := decision with input as does_not_warn_for_generic_search_text_on_unrelated_call_node

  count(result.warn) == 0
}

# Parser output for `TextField("Search", text: $query)` at 14:7.
warns_for_text_field_search_placeholder_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 14, "column": 7}, "end": {"line": 14, "column": 40}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 14, "column": 7}, "end": {"line": 14, "column": 16}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 7}, "end": {"line": 14, "column": 16}}, "token": {"kind": "identifier", "text": "TextField"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 16}, "end": {"line": 14, "column": 17}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 14, "column": 17}, "end": {"line": 14, "column": 39}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 14, "column": 17}, "end": {"line": 14, "column": 26}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 14, "column": 17}, "end": {"line": 14, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 17}, "end": {"line": 14, "column": 18}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 14, "column": 18}, "end": {"line": 14, "column": 24}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 14, "column": 18}, "end": {"line": 14, "column": 24}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 18}, "end": {"line": 14, "column": 24}}, "token": {"kind": "stringSegment", "text": "Search"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 24}, "end": {"line": 14, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 25}, "end": {"line": 14, "column": 26}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 14, "column": 27}, "end": {"line": 14, "column": 39}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 27}, "end": {"line": 14, "column": 31}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 31}, "end": {"line": 14, "column": 32}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 14, "column": 33}, "end": {"line": 14, "column": 39}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 33}, "end": {"line": 14, "column": 39}}, "token": {"kind": "identifier", "text": "$query"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 39}, "end": {"line": 14, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 14, "column": 40}, "end": {"line": 14, "column": 40}}, "children": []},
]}

# Parser output for `list.searchable(text: $query, placement: .toolbar, prompt: "Search")` at 31:5.
warns_for_searchable_member_search_placeholder_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 5}, "end": {"line": 31, "column": 73}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 31, "column": 5}, "end": {"line": 31, "column": 20}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 5}, "end": {"line": 31, "column": 9}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 5}, "end": {"line": 31, "column": 9}}, "token": {"kind": "identifier", "text": "list"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 10}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 10}, "end": {"line": 31, "column": 20}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 10}, "end": {"line": 31, "column": 20}}, "token": {"kind": "identifier", "text": "searchable"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 20}, "end": {"line": 31, "column": 21}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 21}, "end": {"line": 31, "column": 72}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 21}, "end": {"line": 31, "column": 34}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 21}, "end": {"line": 31, "column": 25}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 25}, "end": {"line": 31, "column": 26}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 27}, "end": {"line": 31, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 27}, "end": {"line": 31, "column": 33}}, "token": {"kind": "identifier", "text": "$query"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 33}, "end": {"line": 31, "column": 34}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 35}, "end": {"line": 31, "column": 55}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 35}, "end": {"line": 31, "column": 44}}, "token": {"kind": "identifier", "text": "placement"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 44}, "end": {"line": 31, "column": 45}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 31, "column": 46}, "end": {"line": 31, "column": 54}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 46}, "end": {"line": 31, "column": 47}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 47}, "end": {"line": 31, "column": 54}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 47}, "end": {"line": 31, "column": 54}}, "token": {"kind": "identifier", "text": "toolbar"}, "children": []},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 54}, "end": {"line": 31, "column": 55}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 56}, "end": {"line": 31, "column": 72}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 56}, "end": {"line": 31, "column": 62}}, "token": {"kind": "identifier", "text": "prompt"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 62}, "end": {"line": 31, "column": 63}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 64}, "end": {"line": 31, "column": 72}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 64}, "end": {"line": 31, "column": 65}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 65}, "end": {"line": 31, "column": 71}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 65}, "end": {"line": 31, "column": 71}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 65}, "end": {"line": 31, "column": 71}}, "token": {"kind": "stringSegment", "text": "Search"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 71}, "end": {"line": 31, "column": 72}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 72}, "end": {"line": 31, "column": 73}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 73}, "end": {"line": 31, "column": 73}}, "children": []},
]}

# Parser output for `searchable(text: $query, prompt: "Search")` at 37:5.
warns_for_searchable_base_search_prompt_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 37, "column": 5}, "end": {"line": 37, "column": 47}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 37, "column": 5}, "end": {"line": 37, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 37, "column": 5}, "end": {"line": 37, "column": 15}}, "token": {"kind": "identifier", "text": "searchable"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 37, "column": 15}, "end": {"line": 37, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 37, "column": 16}, "end": {"line": 37, "column": 46}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 37, "column": 16}, "end": {"line": 37, "column": 29}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 37, "column": 16}, "end": {"line": 37, "column": 20}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 37, "column": 20}, "end": {"line": 37, "column": 21}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 37, "column": 22}, "end": {"line": 37, "column": 28}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 37, "column": 22}, "end": {"line": 37, "column": 28}}, "token": {"kind": "identifier", "text": "$query"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 37, "column": 28}, "end": {"line": 37, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 37, "column": 30}, "end": {"line": 37, "column": 46}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 37, "column": 30}, "end": {"line": 37, "column": 36}}, "token": {"kind": "identifier", "text": "prompt"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 37, "column": 36}, "end": {"line": 37, "column": 37}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 37, "column": 38}, "end": {"line": 37, "column": 46}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 37, "column": 38}, "end": {"line": 37, "column": 39}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 37, "column": 39}, "end": {"line": 37, "column": 45}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 37, "column": 39}, "end": {"line": 37, "column": 45}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 37, "column": 39}, "end": {"line": 37, "column": 45}}, "token": {"kind": "stringSegment", "text": "Search"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 37, "column": 45}, "end": {"line": 37, "column": 46}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 37, "column": 46}, "end": {"line": 37, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 37, "column": 47}, "end": {"line": 37, "column": 47}}, "children": []},
]}

# Parser output for `TextField("Search messages", text: $query)` at 19:7.
does_not_warn_for_descriptive_search_placeholder_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 19, "column": 7}, "end": {"line": 19, "column": 49}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 19, "column": 7}, "end": {"line": 19, "column": 16}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 7}, "end": {"line": 19, "column": 16}}, "token": {"kind": "identifier", "text": "TextField"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 16}, "end": {"line": 19, "column": 17}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 19, "column": 17}, "end": {"line": 19, "column": 48}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 19, "column": 17}, "end": {"line": 19, "column": 35}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 19, "column": 17}, "end": {"line": 19, "column": 34}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 17}, "end": {"line": 19, "column": 18}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 19, "column": 18}, "end": {"line": 19, "column": 33}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 19, "column": 18}, "end": {"line": 19, "column": 33}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 18}, "end": {"line": 19, "column": 33}}, "token": {"kind": "stringSegment", "text": "Search messages"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 33}, "end": {"line": 19, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 34}, "end": {"line": 19, "column": 35}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 19, "column": 36}, "end": {"line": 19, "column": 48}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 36}, "end": {"line": 19, "column": 40}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 40}, "end": {"line": 19, "column": 41}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 19, "column": 42}, "end": {"line": 19, "column": 48}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 42}, "end": {"line": 19, "column": 48}}, "token": {"kind": "identifier", "text": "$query"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 48}, "end": {"line": 19, "column": 49}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 19, "column": 49}, "end": {"line": 19, "column": 49}}, "children": []},
]}

# Parser output for `list.searchable(text: $query, placement: .toolbar, "Search")` at 41:5.
does_not_warn_for_searchable_search_without_prompt_label_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 41, "column": 5}, "end": {"line": 41, "column": 65}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 41, "column": 5}, "end": {"line": 41, "column": 20}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 41, "column": 5}, "end": {"line": 41, "column": 9}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 5}, "end": {"line": 41, "column": 9}}, "token": {"kind": "identifier", "text": "list"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 9}, "end": {"line": 41, "column": 10}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 41, "column": 10}, "end": {"line": 41, "column": 20}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 10}, "end": {"line": 41, "column": 20}}, "token": {"kind": "identifier", "text": "searchable"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 20}, "end": {"line": 41, "column": 21}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 41, "column": 21}, "end": {"line": 41, "column": 64}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 41, "column": 21}, "end": {"line": 41, "column": 34}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 21}, "end": {"line": 41, "column": 25}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 25}, "end": {"line": 41, "column": 26}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 41, "column": 27}, "end": {"line": 41, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 27}, "end": {"line": 41, "column": 33}}, "token": {"kind": "identifier", "text": "$query"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 33}, "end": {"line": 41, "column": 34}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 41, "column": 35}, "end": {"line": 41, "column": 55}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 35}, "end": {"line": 41, "column": 44}}, "token": {"kind": "identifier", "text": "placement"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 44}, "end": {"line": 41, "column": 45}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 41, "column": 46}, "end": {"line": 41, "column": 54}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 46}, "end": {"line": 41, "column": 47}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 41, "column": 47}, "end": {"line": 41, "column": 54}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 47}, "end": {"line": 41, "column": 54}}, "token": {"kind": "identifier", "text": "toolbar"}, "children": []},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 54}, "end": {"line": 41, "column": 55}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 41, "column": 56}, "end": {"line": 41, "column": 64}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 41, "column": 56}, "end": {"line": 41, "column": 64}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 56}, "end": {"line": 41, "column": 57}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 41, "column": 57}, "end": {"line": 41, "column": 63}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 41, "column": 57}, "end": {"line": 41, "column": 63}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 57}, "end": {"line": 41, "column": 63}}, "token": {"kind": "stringSegment", "text": "Search"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 63}, "end": {"line": 41, "column": 64}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 64}, "end": {"line": 41, "column": 65}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 41, "column": 65}, "end": {"line": 41, "column": 65}}, "children": []},
]}

# Parser output for `Button("Search", action: search)` at 23:9.
does_not_warn_for_generic_search_text_on_unrelated_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 23, "column": 9}, "end": {"line": 23, "column": 41}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 23, "column": 9}, "end": {"line": 23, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 9}, "end": {"line": 23, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 15}, "end": {"line": 23, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 23, "column": 16}, "end": {"line": 23, "column": 40}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 23, "column": 16}, "end": {"line": 23, "column": 25}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 23, "column": 16}, "end": {"line": 23, "column": 24}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 16}, "end": {"line": 23, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 23, "column": 17}, "end": {"line": 23, "column": 23}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 23, "column": 17}, "end": {"line": 23, "column": 23}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 17}, "end": {"line": 23, "column": 23}}, "token": {"kind": "stringSegment", "text": "Search"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 23}, "end": {"line": 23, "column": 24}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 24}, "end": {"line": 23, "column": 25}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 23, "column": 26}, "end": {"line": 23, "column": 40}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 26}, "end": {"line": 23, "column": 32}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 32}, "end": {"line": 23, "column": 33}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 23, "column": 34}, "end": {"line": 23, "column": 40}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 34}, "end": {"line": 23, "column": 40}}, "token": {"kind": "identifier", "text": "search"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 40}, "end": {"line": 23, "column": 41}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 23, "column": 41}, "end": {"line": 23, "column": 41}}, "children": []},
]}
