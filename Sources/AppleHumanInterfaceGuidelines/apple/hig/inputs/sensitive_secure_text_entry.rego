package apple.hig.inputs.sensitive_secure_text_entry
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := sensitive_secure_text_entry_warning[_]
]

sensitive_text_terms := {"password", "passcode", "security code", "cvv"}

sensitive_secure_text_entry_warning contains {
  "rule_id": "apple.hig.inputs.review_sensitive_secure_text_entry",
  "message": "Review sensitive text entry; use SecureField or secure text entry for passwords, passcodes, PINs, security codes, and CVV values.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "TextField"

  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  term := sensitive_text_terms[_]
  contains(lower(argument), term)
}

sensitive_secure_text_entry_warning contains {
  "rule_id": "apple.hig.inputs.review_sensitive_secure_text_entry",
  "message": "Review sensitive text entry; use SecureField or secure text entry for passwords, passcodes, PINs, security codes, and CVV values.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "TextField"

  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  label := lower(argument)
  {label == "pin", startswith(label, "pin "), contains(label, " pin")}[true]
}
