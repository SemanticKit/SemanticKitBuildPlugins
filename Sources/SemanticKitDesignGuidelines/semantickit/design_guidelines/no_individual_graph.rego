package semantickit.design_guidelines.no_individual_graph

# `IndividualGraph` is a private store of individuals beside the RDFCore graph.
# DESIGN-CONTRACT.md rule 1 (Charles): "Build on our own stack." Wrong:
# `IndividualGraph` (the code he quoted).

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

denial_set contains {
  "rule_id": "semantickit.design_guidelines.no_individual_graph",
  "message": "Do not declare or use IndividualGraph; individuals live in the RDFCore graph of our own stack.",
  "line": token.range.start.line,
  "column": token.range.start.column,
  "severity": "error",
} if {
  token := input
  token.type == "TokenSyntax"
  token.token.kind == "identifier"
  token.token.text == "IndividualGraph"
}
