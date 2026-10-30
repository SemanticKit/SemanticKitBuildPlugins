package apple.hig.siri.voice_shortcut_terms
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := voice_shortcut_terms_warning[_]
]

visible_string_call_names := {"Text", "Label", "Button", "TextField", "help"}

discouraged_voice_shortcut_terms := {
  "add voice shortcut",
  "add voice shortcuts",
  "make a voice command",
  "create a voice prompt",
}

voice_shortcut_terms_warning contains {
  "rule_id": "apple.hig.siri.review_voice_shortcut_terms",
  "message": "Review visible Siri shortcut terminology; avoid phrases such as Add Voice Shortcut, Make a Voice Command, or Create Voice Prompt.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  visible_string_call_names[reference.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  normalized_argument := lower(argument)
  discouraged_term := discouraged_voice_shortcut_terms[_]
  contains(normalized_argument, discouraged_term)
}

# The name a call calls: `Text` in `Text("…")`, `help` in `.help("…")`.
called_reference(call) := call.calledExpression.declReferenceExpr

called_reference(call) := call.calledExpression.memberAccessExpr.declName
