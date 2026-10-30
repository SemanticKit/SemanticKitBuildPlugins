package semantickit.design_guidelines.no_individual_graph

# `IndividualGraph` is a private store of individuals beside the RDFCore graph.
# DESIGN-CONTRACT.md rule 1 (Charles): "Build on our own stack." Wrong:
# `IndividualGraph` (the code he quoted).

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

finding(node) := {
  "rule_id": "semantickit.design_guidelines.no_individual_graph",
  "message": "Do not declare or use IndividualGraph; individuals live in the RDFCore graph of our own stack.",
  "line": node.range.start.line,
  "column": node.range.start.column,
  "severity": "error",
}

# `IndividualGraph()`, `graph: IndividualGraph`, `Store.IndividualGraph`
denial_set contains finding(node) if {
  some node in input.declReferenceExprs
  node.baseName == "IndividualGraph"
}

denial_set contains finding(node) if {
  some node in input.identifierTypes
  node.name == "IndividualGraph"
}

denial_set contains finding(node) if {
  some node in input.memberTypes
  node.name == "IndividualGraph"
}

# `final class IndividualGraph`, `struct IndividualGraph`
denial_set contains finding(decl) if {
  some decl in declarations
  decl.name == "IndividualGraph"
}

declarations contains decl if some decl in input.classDecls

declarations contains decl if some decl in input.structDecls

declarations contains decl if some decl in input.enumDecls

declarations contains decl if some decl in input.actorDecls

declarations contains decl if some decl in input.protocolDecls
