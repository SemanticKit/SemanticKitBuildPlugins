package apple.hig.presentation.window_sizing

test_warns_for_base_default_size_call if {
	result := decision with input as warns_for_base_default_size_call_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_window_sizing_constraints"
	result.warn[0].message == "Review explicit window sizing; confirm the initial size fits content and resizing keeps content usable."
	result.warn[0].line == 16
	result.warn[0].column == 10
	result.warn[0].severity == "warning"
}

test_warns_for_member_window_resizability_call if {
	result := decision with input as warns_for_member_window_resizability_call_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_window_sizing_constraints"
	result.warn[0].line == 22
	result.warn[0].column == 8
	result.warn[0].severity == "warning"
}

test_does_not_warn_for_unrelated_frame_call if {
	result := decision with input as does_not_warn_for_unrelated_frame_call_node

	count(result.warn) == 0
}

# Parser output for `defaultSize(width: 1280, height: 720)` at 16:10.
warns_for_base_default_size_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 16, "column": 10}, "end": {"line": 16, "column": 47}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 10}, "end": {"line": 16, "column": 21}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 10}, "end": {"line": 16, "column": 21}}, "token": {"kind": "identifier", "text": "defaultSize"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 21}, "end": {"line": 16, "column": 22}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 16, "column": 22}, "end": {"line": 16, "column": 46}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 16, "column": 22}, "end": {"line": 16, "column": 34}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 22}, "end": {"line": 16, "column": 27}}, "token": {"kind": "identifier", "text": "width"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 27}, "end": {"line": 16, "column": 28}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 16, "column": 29}, "end": {"line": 16, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 29}, "end": {"line": 16, "column": 33}}, "token": {"kind": "integerLiteral", "text": "1280"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 33}, "end": {"line": 16, "column": 34}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 16, "column": 35}, "end": {"line": 16, "column": 46}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 35}, "end": {"line": 16, "column": 41}}, "token": {"kind": "identifier", "text": "height"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 41}, "end": {"line": 16, "column": 42}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 16, "column": 43}, "end": {"line": 16, "column": 46}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 43}, "end": {"line": 16, "column": 46}}, "token": {"kind": "integerLiteral", "text": "720"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 46}, "end": {"line": 16, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 16, "column": 47}, "end": {"line": 16, "column": 47}}, "children": []},
]}

# Parser output for `window.windowResizability(.contentSize)` at 22:8.
warns_for_member_window_resizability_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 22, "column": 8}, "end": {"line": 22, "column": 47}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 22, "column": 8}, "end": {"line": 22, "column": 33}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 8}, "end": {"line": 22, "column": 14}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 8}, "end": {"line": 22, "column": 14}}, "token": {"kind": "identifier", "text": "window"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 14}, "end": {"line": 22, "column": 15}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 33}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 33}}, "token": {"kind": "identifier", "text": "windowResizability"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 33}, "end": {"line": 22, "column": 34}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 22, "column": 34}, "end": {"line": 22, "column": 46}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 34}, "end": {"line": 22, "column": 46}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 22, "column": 34}, "end": {"line": 22, "column": 46}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 34}, "end": {"line": 22, "column": 35}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 35}, "end": {"line": 22, "column": 46}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 35}, "end": {"line": 22, "column": 46}}, "token": {"kind": "identifier", "text": "contentSize"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 46}, "end": {"line": 22, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 22, "column": 47}, "end": {"line": 22, "column": 47}}, "children": []},
]}

# Parser output for `content.frame(width: 320, height: 240)` at 44:12.
does_not_warn_for_unrelated_frame_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 44, "column": 12}, "end": {"line": 44, "column": 50}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 44, "column": 12}, "end": {"line": 44, "column": 25}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 12}, "end": {"line": 44, "column": 19}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 12}, "end": {"line": 44, "column": 19}}, "token": {"kind": "identifier", "text": "content"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 19}, "end": {"line": 44, "column": 20}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 20}, "end": {"line": 44, "column": 25}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 20}, "end": {"line": 44, "column": 25}}, "token": {"kind": "identifier", "text": "frame"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 25}, "end": {"line": 44, "column": 26}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 44, "column": 26}, "end": {"line": 44, "column": 49}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 26}, "end": {"line": 44, "column": 37}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 26}, "end": {"line": 44, "column": 31}}, "token": {"kind": "identifier", "text": "width"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 31}, "end": {"line": 44, "column": 32}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 44, "column": 33}, "end": {"line": 44, "column": 36}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 33}, "end": {"line": 44, "column": 36}}, "token": {"kind": "integerLiteral", "text": "320"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 36}, "end": {"line": 44, "column": 37}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 38}, "end": {"line": 44, "column": 49}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 38}, "end": {"line": 44, "column": 44}}, "token": {"kind": "identifier", "text": "height"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 44}, "end": {"line": 44, "column": 45}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 44, "column": 46}, "end": {"line": 44, "column": 49}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 46}, "end": {"line": 44, "column": 49}}, "token": {"kind": "integerLiteral", "text": "240"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 49}, "end": {"line": 44, "column": 50}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 44, "column": 50}, "end": {"line": 44, "column": 50}}, "children": []},
]}
