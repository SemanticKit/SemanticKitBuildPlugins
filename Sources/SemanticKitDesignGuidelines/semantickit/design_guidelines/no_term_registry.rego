package semantickit.design_guidelines.no_term_registry

# A registry looks terms up by name instead of by type. Denied:
# - a dictionary keyed by IRI (or by an IRI under another type name: `URL`,
#   `URI`, `NamedNode`, `IRIRef`), whatever it holds: the binding identity rule (Charles) names
#   "Registries or dictionaries keyed by IRI";
# - a dictionary keyed by String (or Substring) whose values are terms: a term kind
#   (`Term`, `Property`, `Class`, ...), a metatype (`Term.Type`), or, in a
#   literal, values named by their keys (`["knows": Knows()]`): "dictionaries
#   keyed by ... string term names". A String-keyed dictionary of other values
#   (`[String: String]` headers, `[String: Int]` counts) is not a term registry;
# - a dictionary literal keyed by IRIs (`IRI(...)`, `.iri`, `.rawValue`, or an
#   IRI or prefixed-name string such as "http://..." or "foaf:knows");
# - a type named `...Registry`, declared, extended or used:
#   `TermRegistry.shared`, `var terms: TermRegistry`.
# DESIGN-CONTRACT.md rule 2 (Charles): "The type is the identity. ... Types
# never communicate through IRI strings." RDFKit DslInvariants: no registries.

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

message := "Do not look terms up in a registry or a dictionary keyed by IRI or by term names; a term is its type, and code refers to it by type."

# `[IRI: Term]`, `[Swift.String: Term]`
denial_set contains finding(node) if {
  some node in input.dictionaryTypes
  registry_types(node.key, node.value)
}

# `Dictionary<IRI, Term>`
denial_set contains finding(node) if {
  some node in input.identifierTypes
  node.name == "Dictionary"
  registry_types(generic_argument(node, 0), generic_argument(node, 1))
}

# `Swift.Dictionary<IRIKit.IRI, Term>`
denial_set contains finding(node) if {
  some node in input.memberTypes
  node.name == "Dictionary"
  registry_types(generic_argument(node, 0), generic_argument(node, 1))
}

# `[IRI: Term]()`, `[IRI: Term].init()`, `Dictionary<IRI, Term>()`,
# `Swift.Dictionary<String, Term>.init()`
denial_set contains finding(call) if {
  some call in input.functionCallExprs
  some dictionary in dictionary_expressions(call.calledExpression)
  name_keyed_expression(dictionary)
}

# The dictionary a call builds: the callee, or the base of its `.init`.
dictionary_expressions(callee) := {callee} | {base |
  callee.memberAccessExpr.declName.baseName == "init"
  base := callee.memberAccessExpr.base
}

# `[IRI: Term]()`: the dictionary type spelled as an expression.
name_keyed_expression(dictionary) if {
  [element] := dictionary.dictionaryExpr.elements
  registry_expression_types(element.key, element.value)
}

name_keyed_expression(expression) if {
  specialization := expression.genericSpecializationExpr
  reference_name(specialization.expression) == "Dictionary"
  registry_types(generic_argument(specialization, 0), generic_argument(specialization, 1))
}

# `["knows": Knows(), "name": Name()]`, `[Foaf.knows.iri: ...]`,
# `["http://xmlns.com/foaf/0.1/knows": ...]`: a registry written as a literal.
denial_set contains finding(node) if {
  some node in input.dictionaryExprs
  some element in node.elements
  registry_entry(element.key, element.value)
}

registry_entry(key, _) if iri_key_expression(key)

registry_entry(key, value) if {
  name := string_literal_text(key)
  term_named_value(name, value)
}

# `IRI("...")`, `try! IRI(validating: "...")`, `URL(string: "...")`
iri_key_expression(key) if {
  some form in forms(key)
  callee_name(form.functionCallExpr) in iri_keys
}

# `Foaf.knows.iri`, `term.rawValue`
iri_key_expression(key) if key.memberAccessExpr.declName.baseName in {"iri", "rawValue"}

# "http://xmlns.com/foaf/0.1/knows", "foaf:knows"
iri_key_expression(key) if regex.match(`^[A-Za-z][A-Za-z0-9+.-]*:[^\s]+$`, string_literal_text(key))

# A value named by its key, `"knows": Knows()`, a term kind, `"knows":
# Property(...)`, or a metatype, `"knows": Knows.self`.
term_named_value(name, value) if {
  some form in forms(value)
  callee := callee_name(form.functionCallExpr)
  lower(callee) == lower(name)
}

term_named_value(_, value) if {
  some form in forms(value)
  callee_name(form.functionCallExpr) in term_kinds
}

term_named_value(_, value) if value.memberAccessExpr.declName.baseName == "self"

# The text of a string literal with one plain segment.
string_literal_text(expression) := segment.stringSegment.content if {
  [segment] := expression.stringLiteralExpr.segments
}

# The type a generic argument names: `IRI` in `Dictionary<IRI, Term>`.
generic_argument(node, index) := node.genericArgumentClause.arguments[index].argument.type

# Key and value types of a registry: any IRI key, or a String key with term values.
registry_types(key, _) if named_type(key, iri_keys)

registry_types(key, value) if {
  named_type(key, string_keys)
  term_value_type(value)
}

# The same, with the types spelled as expressions, as in `[IRI: Term]()`.
registry_expression_types(key, _) if reference_name(key) in iri_keys

registry_expression_types(key, value) if {
  reference_name(key) in string_keys
  term_value_expression(value)
}

term_value_expression(value) if reference_name(value) in term_kinds

# `Term.Type`
term_value_expression(value) if value.memberAccessExpr.declName.baseName == "Type"

# `any Term.Type`, `Term?`: a type spelled in an expression, as in
# `[String: any Term.Type]()`.
term_value_expression(value) if term_value_type(value.typeExpr.type)

# `IRI`, `String`, `IRIKit.IRI`, `Swift.String`, `Foundation.URL`
named_type(type, names) if type.identifierType.name in names

named_type(type, names) if type.memberType.name in names

# `Term`, `Property`, `RDFKit.Class`, `Term.Type`, `any Term.Type`, `Term?`,
# `[Term]`: a term kind or a metatype anywhere in the value type.
term_value_type(type) if {
  walk(type, [_, node])
  named_type(node, term_kinds)
}

term_value_type(type) if {
  walk(type, [_, node])
  node.metatypeType
}

# `Foaf`, `Vocabularies.Foaf`
reference_name(expression) := expression.declReferenceExpr.baseName

reference_name(expression) := expression.memberAccessExpr.declName.baseName

# The expression, and what `try`, `try!`, `await`, `!` and `?` wrap, two
# levels deep.
forms(value) := {value} | inner(value) | {deeper | some form in inner(value); some deeper in inner(form)}

inner(value) := (({child | child := value.tryExpr.expression} | {child | child := value.awaitExpr.expression}) | {child | child := value.forceUnwrapExpr.expression}) | {child | child := value.optionalChainingExpr.expression}

# `IRI`, `IRIKit.IRI`, `IRI.init`, `IRIKit.IRI.init`
callee_name(call) := call.calledExpression.declReferenceExpr.baseName

callee_name(call) := name if {
  name := call.calledExpression.memberAccessExpr.declName.baseName
  name != "init"
}

callee_name(call) := reference_name(access.base) if {
  access := call.calledExpression.memberAccessExpr
  access.declName.baseName == "init"
}

# `final class TermRegistry`, `struct VocabularyRegistry`
denial_set contains finding(decl) if {
  some decl in registry_declarations
  endswith(decl.name, "Registry")
}

registry_declarations contains decl if some decl in input.classDecls

registry_declarations contains decl if some decl in input.structDecls

registry_declarations contains decl if some decl in input.enumDecls

registry_declarations contains decl if some decl in input.actorDecls

registry_declarations contains decl if some decl in input.protocolDecls

# `TermRegistry.shared`, `TermRegistry()`: a registry in use.
denial_set contains finding(node) if {
  some node in input.declReferenceExprs
  endswith(node.baseName, "Registry")
}

# `var terms: TermRegistry`, `extension TermRegistry`
denial_set contains finding(node) if {
  some node in input.identifierTypes
  endswith(node.name, "Registry")
}

finding(node) := {
  "rule_id": "semantickit.design_guidelines.no_term_registry",
  "message": message,
  "line": node.range.start.line,
  "column": node.range.start.column,
  "severity": "error",
}

iri_keys := {"IRI", "URL", "URI", "NamedNode", "IRIRef"}

string_keys := {"String", "Substring"}

term_kinds := {
  "Term",
  "Property",
  "Class",
  "ObjectProperty",
  "DatatypeProperty",
  "AnnotationProperty",
  "Datatype",
  "Individual",
  "NamedIndividual",
}
