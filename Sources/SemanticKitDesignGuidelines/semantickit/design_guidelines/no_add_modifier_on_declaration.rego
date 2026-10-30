package semantickit.design_guidelines.no_add_modifier_on_declaration

# `Class("Foo").addLabel(…).addComment(…).isDeclaredBy(namespace:)` modifies a
# type declared in an ontology. Label and Comment are declarations in the
# content of the declaration they describe.
# DESIGN-CONTRACT.md rule 6 (Charles, PR #3 review): "`add*` indicates type
# modification, and is the lazy pattern here." "`isDeclaredBy` looks like an
# expression shortcut."

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

denial_set contains {
  "rule_id": "semantickit.design_guidelines.no_add_modifier_on_declaration",
  "message": "Do not chain add* or isDeclaredBy modifiers onto a declaration; declare Label, Comment and the rest in the declaration's content.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "error",
} if {
  some call in input.functionCallExprs
  access := call.calledExpression.memberAccessExpr
  type_modifier(access.declName.baseName)
  declaration_chain(access.base)
}

type_modifier(name) if regex.match(`^add[A-Z]`, name)

type_modifier("isDeclaredBy")

# The chain starts with an ontology declaration such as `Class("Foo")`: a call
# of a declaration kind at the very start of the chain, however the kind is
# spelled: `Class("Foo")`, `RDFKit.Class("Foo")`, `Class.init("Foo")`,
# `RDFKit.Class.init("Foo")`. A chain on any other value,
# `Dataset().addGraph(g)`, modifies an instance, which Charles allows:
# "SwiftUI modifiers modify instances" (rule 6).
declaration_chain(base) if {
  some start in base
  walk(base, [_, node])
  call := node.functionCallExpr
  call.range.start == start.range.start
  callee_name(call) in declaration_kinds
}

# `Class`, `RDFKit.Class`, `Class.init`, `RDFKit.Class.init`
callee_name(call) := call.calledExpression.declReferenceExpr.baseName

callee_name(call) := name if {
  name := call.calledExpression.memberAccessExpr.declName.baseName
  name != "init"
}

callee_name(call) := reference_name(access.base) if {
  access := call.calledExpression.memberAccessExpr
  access.declName.baseName == "init"
}

reference_name(expression) := expression.declReferenceExpr.baseName

reference_name(expression) := expression.memberAccessExpr.declName.baseName

declaration_kinds := {
  "Class",
  "Property",
  "ObjectProperty",
  "DatatypeProperty",
  "AnnotationProperty",
  "Datatype",
  "Individual",
  "NamedIndividual",
  "Ontology",
}
