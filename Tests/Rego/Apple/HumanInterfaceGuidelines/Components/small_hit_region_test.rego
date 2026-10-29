package apple.hig.components.small_hit_region

test_warns_for_explicit_small_frame_dimensions_that_may_affect_hit_regions if {
  result := decision with input as warns_for_explicit_small_frame_dimensions_that_may_affect_hit_regions_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_small_hit_region"
  result.warn[0].message == "Review explicit small frame dimensions; width or height below 44 pt may affect interactive hit regions."
  result.warn[0].line == 31
  result.warn[0].column == 12
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_explicit_44_by_44_frame_dimensions if {
  result := decision with input as does_not_warn_for_explicit_44_by_44_frame_dimensions_node

  count(result.warn) == 0
}

test_does_not_warn_for_small_numeric_argument_without_width_and_height_labels if {
  result := decision with input as does_not_warn_for_small_numeric_argument_without_width_and_height_labels_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_frame_call if {
  result := decision with input as does_not_warn_for_non_frame_call_node

  count(result.warn) == 0
}

# Parser output for `icon.frame(width: 32, height: 32)` at 31:12.
warns_for_explicit_small_frame_dimensions_that_may_affect_hit_regions_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 45}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 22}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 16}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 16}}, "token": {"kind": "identifier", "text": "icon"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 17}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 22}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 22}}, "token": {"kind": "identifier", "text": "frame"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 22}, "end": {"line": 31, "column": 23}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 23}, "end": {"line": 31, "column": 44}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 23}, "end": {"line": 31, "column": 33}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 23}, "end": {"line": 31, "column": 28}}, "token": {"kind": "identifier", "text": "width"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 28}, "end": {"line": 31, "column": 29}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 31, "column": 30}, "end": {"line": 31, "column": 32}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 30}, "end": {"line": 31, "column": 32}}, "token": {"kind": "integerLiteral", "text": "32"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 32}, "end": {"line": 31, "column": 33}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 34}, "end": {"line": 31, "column": 44}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 34}, "end": {"line": 31, "column": 40}}, "token": {"kind": "identifier", "text": "height"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 40}, "end": {"line": 31, "column": 41}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 31, "column": 42}, "end": {"line": 31, "column": 44}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 42}, "end": {"line": 31, "column": 44}}, "token": {"kind": "integerLiteral", "text": "32"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 44}, "end": {"line": 31, "column": 45}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 45}, "end": {"line": 31, "column": 45}}, "children": []},
]}

# Parser output for `icon.frame(width: 44, height: 44)` at 31:12.
does_not_warn_for_explicit_44_by_44_frame_dimensions_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 45}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 22}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 16}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 16}}, "token": {"kind": "identifier", "text": "icon"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 17}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 22}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 22}}, "token": {"kind": "identifier", "text": "frame"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 22}, "end": {"line": 31, "column": 23}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 23}, "end": {"line": 31, "column": 44}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 23}, "end": {"line": 31, "column": 33}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 23}, "end": {"line": 31, "column": 28}}, "token": {"kind": "identifier", "text": "width"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 28}, "end": {"line": 31, "column": 29}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 31, "column": 30}, "end": {"line": 31, "column": 32}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 30}, "end": {"line": 31, "column": 32}}, "token": {"kind": "integerLiteral", "text": "44"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 32}, "end": {"line": 31, "column": 33}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 34}, "end": {"line": 31, "column": 44}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 34}, "end": {"line": 31, "column": 40}}, "token": {"kind": "identifier", "text": "height"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 40}, "end": {"line": 31, "column": 41}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 31, "column": 42}, "end": {"line": 31, "column": 44}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 42}, "end": {"line": 31, "column": 44}}, "token": {"kind": "integerLiteral", "text": "44"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 44}, "end": {"line": 31, "column": 45}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 45}, "end": {"line": 31, "column": 45}}, "children": []},
]}

# Parser output for `icon.frame(width: 32)` at 31:12.
does_not_warn_for_small_numeric_argument_without_width_and_height_labels_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 33}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 22}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 16}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 16}}, "token": {"kind": "identifier", "text": "icon"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 17}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 22}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 22}}, "token": {"kind": "identifier", "text": "frame"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 22}, "end": {"line": 31, "column": 23}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 23}, "end": {"line": 31, "column": 32}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 23}, "end": {"line": 31, "column": 32}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 23}, "end": {"line": 31, "column": 28}}, "token": {"kind": "identifier", "text": "width"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 28}, "end": {"line": 31, "column": 29}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 31, "column": 30}, "end": {"line": 31, "column": 32}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 30}, "end": {"line": 31, "column": 32}}, "token": {"kind": "integerLiteral", "text": "32"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 32}, "end": {"line": 31, "column": 33}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 33}, "end": {"line": 31, "column": 33}}, "children": []},
]}

# Parser output for `icon.customSize(width: 32, height: 32)` at 31:12.
does_not_warn_for_non_frame_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 50}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 27}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 16}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 16}}, "token": {"kind": "identifier", "text": "icon"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 17}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 27}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 27}}, "token": {"kind": "identifier", "text": "customSize"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 27}, "end": {"line": 31, "column": 28}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 28}, "end": {"line": 31, "column": 49}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 28}, "end": {"line": 31, "column": 38}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 28}, "end": {"line": 31, "column": 33}}, "token": {"kind": "identifier", "text": "width"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 33}, "end": {"line": 31, "column": 34}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 31, "column": 35}, "end": {"line": 31, "column": 37}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 35}, "end": {"line": 31, "column": 37}}, "token": {"kind": "integerLiteral", "text": "32"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 37}, "end": {"line": 31, "column": 38}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 39}, "end": {"line": 31, "column": 49}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 39}, "end": {"line": 31, "column": 45}}, "token": {"kind": "identifier", "text": "height"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 45}, "end": {"line": 31, "column": 46}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 31, "column": 47}, "end": {"line": 31, "column": 49}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 47}, "end": {"line": 31, "column": 49}}, "token": {"kind": "integerLiteral", "text": "32"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 49}, "end": {"line": 31, "column": 50}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 50}, "end": {"line": 31, "column": 50}}, "children": []},
]}
