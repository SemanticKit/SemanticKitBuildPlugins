package semantickit.design_guidelines.no_term_registry

# A registry looks terms up by name instead of by type. Denied:
# - a dictionary keyed by IRI (or URL, an IRI under another type name),
#   whatever it holds: the binding identity rule (Charles) names
#   "Registries or dictionaries keyed by IRI";
# - a dictionary keyed by String whose values are terms: a term kind
#   (`Term`, `Property`, `Class`, ...), a metatype (`Term.Type`), or, in a
#   literal, values named by their keys (`["knows": Knows()]`): "dictionaries
#   keyed by ... string term names". A String-keyed dictionary of other values
#   (`[String: String]` headers, `[String: Int]` counts) is not a term registry;
# - a dictionary literal keyed by IRIs (`IRI(...)`, `.iri`, `.rawValue`, or an
#   IRI or prefixed-name string such as "http://..." or "foaf:knows");
# - a type named `...Registry`.
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
  node := input
  node.type == "DictionaryTypeSyntax"
  registry_types(node.children[1], node.children[3])
}

# `Dictionary<IRI, Term>`
denial_set contains finding(node) if {
  node := input
  node.type == "IdentifierTypeSyntax"
  node.children[0].token.text == "Dictionary"
  registry_types(generic_argument(node, 0), generic_argument(node, 1))
}

# `Swift.Dictionary<IRIKit.IRI, Term>`
denial_set contains finding(node) if {
  node := input
  node.type == "MemberTypeSyntax"
  some name in node.children
  name.type == "TokenSyntax"
  name.token.text == "Dictionary"
  registry_types(generic_argument(node, 0), generic_argument(node, 1))
}

# `[IRI: Term]()`, `[IRI: Term].init()`, `Dictionary<IRI, Term>()`,
# `Swift.Dictionary<String, Term>.init()`
denial_set contains finding(node) if {
  node := input
  node.type == "FunctionCallExprSyntax"
  some dictionary in dictionary_expressions(node.children[0])
  name_keyed_expression(dictionary)
}

# The dictionary a call builds: the callee, or the base of its `.init`.
dictionary_expressions(callee) := {callee} | {base |
  callee.type == "MemberAccessExprSyntax"
  callee.children[count(callee.children) - 1].children[0].token.text == "init"
  base := callee.children[0]
}

# `[IRI: Term]()`: the dictionary type spelled as an expression.
name_keyed_expression(dictionary) if {
  dictionary.type == "DictionaryExprSyntax"
  some elements in dictionary.children
  elements.type == "DictionaryElementListSyntax"
  count(elements.children) == 1
  element := elements.children[0]
  registry_expression_types(element.children[0], element.children[2])
}

name_keyed_expression(specialization) if {
  specialization.type == "GenericSpecializationExprSyntax"
  callee := specialization.children[0]
  reference_name(callee) == "Dictionary"
  registry_types(generic_argument(specialization, 0), generic_argument(specialization, 1))
}

# `["knows": Knows(), "name": Name()]`, `[Foaf.knows.iri: ...]`,
# `["http://xmlns.com/foaf/0.1/knows": ...]`: a registry written as a literal.
denial_set contains finding(node) if {
  node := input
  node.type == "DictionaryExprSyntax"
  some elements in node.children
  elements.type == "DictionaryElementListSyntax"
  some element in elements.children
  element.type == "DictionaryElementSyntax"
  registry_entry(element.children[0], element.children[2])
}

registry_entry(key, _) if iri_key_expression(key)

registry_entry(key, value) if {
  name := string_literal_text(key)
  term_named_value(name, value)
}

# `IRI("...")`, `try! IRI(validating: "...")`, `URL(string: "...")`
iri_key_expression(key) if {
  some form in forms(key)
  form.type == "FunctionCallExprSyntax"
  callee_name(form.children[0]) in iri_keys
}

# `Foaf.knows.iri`, `term.rawValue`
iri_key_expression(key) if {
  key.type == "MemberAccessExprSyntax"
  reference_name(key) in {"iri", "rawValue"}
}

# "http://xmlns.com/foaf/0.1/knows", "foaf:knows"
iri_key_expression(key) if regex.match(`^[A-Za-z][A-Za-z0-9+.-]*:[^\s]+$`, string_literal_text(key))

# A value named by its key, `"knows": Knows()`, a term kind, `"knows":
# Property(...)`, or a metatype, `"knows": Knows.self`.
term_named_value(name, value) if {
  some form in forms(value)
  form.type == "FunctionCallExprSyntax"
  callee := callee_name(form.children[0])
  lower(callee) == lower(name)
}

term_named_value(_, value) if {
  some form in forms(value)
  form.type == "FunctionCallExprSyntax"
  callee_name(form.children[0]) in term_kinds
}

term_named_value(_, value) if {
  value.type == "MemberAccessExprSyntax"
  reference_name(value) == "self"
}

# The text of a string literal with one plain segment.
string_literal_text(literal) := text if {
  literal.type == "StringLiteralExprSyntax"
  some segments in literal.children
  segments.type == "StringLiteralSegmentListSyntax"
  count(segments.children) == 1
  segment := segments.children[0]
  segment.type == "StringSegmentSyntax"
  text := segment.children[0].token.text
}

generic_argument(node, index) := argument if {
  some clause in node.children
  clause.type == "GenericArgumentClauseSyntax"
  some list in clause.children
  list.type == "GenericArgumentListSyntax"
  argument := list.children[index].children[0]
}

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
term_value_expression(value) if {
  value.type == "MemberAccessExprSyntax"
  reference_name(value) == "Type"
}

# `IRI`, `String`, `IRIKit.IRI`, `Swift.String`, `Foundation.URL`
named_type(type, names) if {
  type.type == "IdentifierTypeSyntax"
  type.children[0].token.text in names
}

named_type(type, names) if {
  type.type == "MemberTypeSyntax"
  some name in type.children
  name.type == "TokenSyntax"
  name.token.kind == "identifier"
  name.token.text in names
}

# `Term`, `Property`, `RDFKit.Class`, `Term.Type`, `any Term.Type`, `Term?`,
# `[Term]`: a term kind or a metatype anywhere in the value type.
term_value_type(type) if {
  walk(type, [_, node])
  named_type(node, term_kinds)
}

term_value_type(type) if {
  walk(type, [_, node])
  node.type == "MetatypeTypeSyntax"
}

reference_name(reference) := reference.children[0].token.text if reference.type == "DeclReferenceExprSyntax"

reference_name(reference) := reference.children[count(reference.children) - 1].children[0].token.text if {
  reference.type == "MemberAccessExprSyntax"
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

# `final class TermRegistry`, `struct VocabularyRegistry`. Each body tests one
# node type, so the evaluator gives the policy only the nodes it can match.
denial_set contains finding(node) if {
  node := input
  node.type == "ClassDeclSyntax"
  registry_name(node)
}

denial_set contains finding(node) if {
  node := input
  node.type == "StructDeclSyntax"
  registry_name(node)
}

denial_set contains finding(node) if {
  node := input
  node.type == "EnumDeclSyntax"
  registry_name(node)
}

denial_set contains finding(node) if {
  node := input
  node.type == "ActorDeclSyntax"
  registry_name(node)
}

denial_set contains finding(node) if {
  node := input
  node.type == "ProtocolDeclSyntax"
  registry_name(node)
}

registry_name(decl) if {
  some name in decl.children
  name.token.kind == "identifier"
  endswith(name.token.text, "Registry")
}

finding(node) := {
  "rule_id": "semantickit.design_guidelines.no_term_registry",
  "message": message,
  "line": node.range.start.line,
  "column": node.range.start.column,
  "severity": "error",
}

iri_keys := {"IRI", "URL"}

string_keys := {"String"}

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
