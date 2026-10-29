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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  visible_string_call_names[callee.children[0].token.text]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  argument := segment.children[0].token.text
  normalized_argument := lower(argument)
  discouraged_term := discouraged_voice_shortcut_terms[_]
  contains(normalized_argument, discouraged_term)
}
