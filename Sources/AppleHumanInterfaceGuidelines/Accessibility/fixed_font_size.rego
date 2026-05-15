package apple.hig.accessibility.fixed_font_size

# METADATA
# scope: document
# entrypoint: true
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := fixed_font_size_warning[_]
]

fixed_font_size_warning contains {
  "rule_id": "apple.hig.accessibility.review_fixed_font_size",
  "message": "Review literal SwiftUI system font size use; support larger text sizes.",
  "artifact": input.sourceFile,
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  walk(input.swiftSyntax, [_, call])
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[count(callee.children) - 1]
  member.type == "DeclReferenceExprSyntax"
  member.children[0].token.text == "system"

  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  argument := argument_list.children[_]
  argument.children[0].token.text == "size"

  literal := argument.children[_]
  {"IntegerLiteralExprSyntax", "FloatLiteralExprSyntax"}[literal.type]
}
