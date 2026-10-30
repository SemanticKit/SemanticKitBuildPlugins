package semantickit.design_guidelines.no_static_iri_constant

# A static property typed IRI, or set to an IRI, is a term held as an IRI
# constant (`ACL.readClass`). Inside the runtime the type is the identity; an
# IRI is read only at the boundary. The one static IRI a type keeps is its own
# projection, `static var iri: IRI { … }`, computed from the namespace.
# Binding identity rule (Charles): "An IRI on a type is a static projection
# computed from the namespace, read only at the boundary."
# DESIGN-CONTRACT.md rule 2 (Charles): "Types never communicate through IRI
# strings. IRIs exist only at the boundary." Rule 3: "No static mapping onto
# enums, structs and statics."

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

denial_set contains {
  "rule_id": "semantickit.design_guidelines.no_static_iri_constant",
  "message": "Do not hold a term as a static IRI constant; the term's type is its identity, and its IRI is read only at the boundary.",
  "line": decl.range.start.line,
  "column": decl.range.start.column,
  "severity": "error",
} if {
  decl := input
  decl.type == "VariableDeclSyntax"
  is_static(decl)
  some bindings in decl.children
  bindings.type == "PatternBindingListSyntax"
  some binding in bindings.children
  iri_binding(binding)
  not projection(binding)
}

is_static(decl) if {
  some modifiers in decl.children
  modifiers.type == "DeclModifierListSyntax"
  some modifier in modifiers.children
  modifier.children[0].token.text in {"static", "class"}
}

# `static var iri: IRI { Self.namespace.iri }`: the type's own IRI, computed.
projection(binding) if {
  binding.children[0].type == "IdentifierPatternSyntax"
  binding.children[0].children[0].token.text == "iri"
  some accessor in binding.children
  accessor.type == "AccessorBlockSyntax"
  not initialized(binding)
}

initialized(binding) if {
  some initializer in binding.children
  initializer.type == "InitializerClauseSyntax"
}

# `static let knows: IRI`, `: IRI?`, `: IRI!`, `: IRIKit.IRI`
iri_binding(binding) if {
  some annotation in binding.children
  annotation.type == "TypeAnnotationSyntax"
  some type in annotation.children
  iri_type(type)
}

# `static let knows = IRI("…")`, `= try! IRI(validating: "…")`, `= IRI.init(…)`
iri_binding(binding) if {
  some initializer in binding.children
  initializer.type == "InitializerClauseSyntax"
  some value in initializer.children
  some form in forms(value)
  form.type == "FunctionCallExprSyntax"
  callee_name(form.children[0]) == "IRI"
}

iri_type(type) if named_iri(type)

iri_type(type) if {
  type.type in {"OptionalTypeSyntax", "ImplicitlyUnwrappedOptionalTypeSyntax"}
  named_iri(type.children[0])
}

named_iri(type) if {
  type.type == "IdentifierTypeSyntax"
  type.children[0].token.text == "IRI"
}

named_iri(type) if {
  type.type == "MemberTypeSyntax"
  some name in type.children
  name.type == "TokenSyntax"
  name.token.kind == "identifier"
  name.token.text == "IRI"
}

# The expression, and what `try`, `try!`, `await` and `!` wrap, two levels deep.
wrappers := {"TryExprSyntax", "AwaitExprSyntax", "ForceUnwrapExprSyntax", "OptionalChainingExprSyntax"}

forms(value) := {value} | inner(value) | {deeper | some form in inner(value); some deeper in inner(form)}

inner(value) := {child |
  value.type in wrappers
  some child in value.children
  child.type != "TokenSyntax"
}

# `IRI`, `IRIKit.IRI`, `IRI.init`, `IRIKit.IRI.init`
callee_name(callee) := reference_name(callee) if not initializer_reference(callee)

callee_name(callee) := reference_name(callee.children[0]) if initializer_reference(callee)

initializer_reference(callee) if {
  callee.type == "MemberAccessExprSyntax"
  callee.children[count(callee.children) - 1].children[0].token.text == "init"
}

reference_name(reference) := reference.children[0].token.text if reference.type == "DeclReferenceExprSyntax"

reference_name(reference) := reference.children[count(reference.children) - 1].children[0].token.text if {
  reference.type == "MemberAccessExprSyntax"
}
