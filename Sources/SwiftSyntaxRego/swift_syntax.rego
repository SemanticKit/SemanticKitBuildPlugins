package swift.syntax

function_calls contains call if {
  input.swiftSyntax != null
  walk(input.swiftSyntax, [_, call])
  is_object(call)
  call.type == "FunctionCallExprSyntax"
}

warning(call, rule_id, message) := {
  "rule_id": rule_id,
  "message": message,
  "artifact": input.sourceFile,
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
}

call_named(call, name) if {
  token := identifier_tokens(call)[_]
  token.text == name
}

call_named_in(call, names) if {
  token := identifier_tokens(call)[_]
  names[token.text]
}

argument_label(call, label) if {
  argument_labels(call)[label]
}

argument_labels(call) := labels if {
  labels := {label |
    token := identifier_tokens(call)[_]
    label := token.text
  }
}

string_argument(call, value) if {
  string_literals(call)[value]
}

string_argument(call, value) if {
  token := string_tokens(call)[_]
  token.text == value
}

string_literals(call) := values if {
  values := {value |
    token := string_tokens(call)[_]
    value := trim_quotes(token.text)
  }
}


has_string_argument(call) if {
  string_tokens(call)[_]
}

has_numeric_argument(call) if {
  numeric_tokens(call)[_]
}

numeric_literals(call) := values if {
  values := {value |
    token := numeric_tokens(call)[_]
    value := token.text
  }
}

identifier_tokens(node) := tokens if {
  tokens := [token |
    token := syntax_tokens(node)[_]
    contains(lower(token.kind), "identifier")
    visible_token_text(token.text)
  ]
}

string_tokens(node) := tokens if {
  tokens := [token |
    token := syntax_tokens(node)[_]
    contains(lower(token.kind), "string")
    visible_string_text(token.text)
  ]
}

numeric_tokens(node) := tokens if {
  tokens := [token |
    token := syntax_tokens(node)[_]
    numeric_token(token)
    visible_token_text(token.text)
  ]
}

syntax_tokens(node) := tokens if {
  tokens := [token |
    walk(node, [_, child])
    is_object(child)
    token := child.token
    is_object(token)
    is_string(token.kind)
    is_string(token.text)
  ]
}

numeric_token(token) if {
  contains(lower(token.kind), "integer")
}

numeric_token(token) if {
  contains(lower(token.kind), "floating")
}

numeric_token(token) if {
  contains(lower(token.kind), "numeric")
}

visible_token_text(text) if {
  text != ""
  text != "\""
  text != "#\""
  text != "\"#"
}

visible_string_text(text) if {
  visible_token_text(text)
  text != "\\("
}

trim_quotes(text) := trimmed if {
  startswith(text, "\"")
  endswith(text, "\"")
  trimmed := substring(text, 1, count(text) - 2)
} else := text if {
  not startswith(text, "\"")
}
