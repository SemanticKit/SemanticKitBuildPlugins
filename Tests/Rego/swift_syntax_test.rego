package swift.syntax.test

source_input(source_file, syntax_children) := {
  "sourceFile": source_file,
  "swiftSyntax": {
    "type": "SourceFileSyntax",
    "range": source_range,
    "children": syntax_children,
  },
}

function_call(line, column, tokens) := {
  "type": "FunctionCallExprSyntax",
  "range": {
    "start": {"line": line, "column": column},
    "end": {"line": line, "column": column + 1},
  },
  "children": tokens,
}

identifier(text) := token("identifier", text)

string_segment(text) := token("stringSegment", text)

integer_literal(text) := token("integerLiteral", text)

token(kind, text) := {
  "type": "TokenSyntax",
  "range": source_range,
  "token": {"kind": kind, "text": text},
  "children": [],
}

source_range := {
  "start": {"line": 1, "column": 1},
  "end": {"line": 1, "column": 1},
}
