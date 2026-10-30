package semantickit.design_guidelines.no_class_value_constant

# `Foaf.agentClass`, `ACL.readClass`: a class read as a static value of its
# ontology, `<name>Class`, instead of named by its type, `Foaf.Agent`.
# DESIGN-CONTRACT.md rule 1 (Charles): "Build on our own stack." Wrong:
# `Foaf.agentClass`, `ACL.readClass` (the code he quoted). Rule 3: "No static
# mapping onto enums, structs and statics."

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

denial_set contains {
  "rule_id": "semantickit.design_guidelines.no_class_value_constant",
  "message": "Do not read a class as a static value (Foaf.agentClass); name the class by its type, Foaf.Agent.",
  "line": access.range.start.line,
  "column": access.range.start.column,
  "severity": "error",
} if {
  some access in input.memberAccessExprs
  regex.match(`^[A-Z]`, reference_name(access.base))
  regex.match(`^[a-z][A-Za-z0-9]*Class$`, access.declName.baseName)
}

# `Foaf`, `Vocabularies.Foaf`
reference_name(expression) := expression.declReferenceExpr.baseName

reference_name(expression) := expression.memberAccessExpr.declName.baseName
