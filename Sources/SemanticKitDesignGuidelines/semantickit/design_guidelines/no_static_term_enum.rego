package semantickit.design_guidelines.no_static_term_enum

# Terms held as static constants on a type, or as the cases of an enum, are a
# static container of terms. A term is declared in the ontology and becomes its
# own type; it is never a constant on an enum, a struct, a class or an
# extension, and never an enum case. Denied:
# - on any enum, struct, class, actor or extension: a static property set to a
#   term (`Term(...)`, `Property(...)`, `Class(...)` and the other declaration
#   kinds), to an instance of the type it is named after
#   (`static let animal = Animal()`), to a string spelling its own name
#   (`static let knows = "knows"`), or a static function without parameters
#   returning a term;
# - on any enum: a static stored property (`enum Fauna { static let animal =
#   ... }`), or a static typed `IRI` or a term kind;
# - an enum named or documented as a vocabulary with cases or statics:
#   `enum Foaf { case knows, person, agent }`, `enum FoafTerm: String { case
#   knows }`, `/// The FOAF vocabulary.` on `enum Friend { case knows }`. A
#   vocabulary name is a prefix of a published vocabulary (`Foaf`, `RDFS`,
#   `Schema`, ...) or ends in `Term(s)`, `Vocabulary`, `Vocab`, `Ontology`,
#   `Namespace`, `Properties`, `Classes`, ...; vocabulary documentation names
#   a vocabulary, an ontology or a namespace;
# - a struct, class, actor or extension named or documented as a vocabulary
#   with a static stored property: `extension Foaf { static let knows = ... }`;
# - a String-raw enum whose raw values are IRIs or prefixed names, or the
#   term's local name (`case animal = "Animal"`).
# A static whose value is an IRI however built (`URL(string: "...")`,
# `"\(ns)knows"`) is `no_static_iri_constant`'s, and is not reported here too.
# Not denied: String-raw enums that are not term mappings, such as
# `CodingKeys` (Codable, contract rule 13) and spec value sets such as RDF 1.2
# base direction (`enum TextDirection: String { case ltr, rtl }`); string
# constants that are not terms on a struct (`static let mediaType =
# "text/turtle"`); result builders (`static func buildBlock`).
# DESIGN-CONTRACT.md rule 3 (Charles): "No static mapping onto enums, structs
# and statics." "I see static properties on some other thing. Like, you're
# writing an enum type. Which makes no fucking sense, compositionally
# speaking." RDFKit DslInvariants: no static enum-style term containers.

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {"deny": denials, "warn": [], "note": []}

denials := [denial | denial := denial_set[_]]

message := "Do not keep terms as static constants, enum cases or String raw values on a type; declare the term in the ontology so that it is its own type."

denial_set contains finding(decl) if {
  some decl in input.enumDecls
  some member in members(decl)
  enum_term_constant(member)
}

denial_set contains finding(decl) if {
  some decl in input.enumDecls
  term_container_name(decl.name)
  some member in members(decl)
  container_member(member)
}

# `enum Fauna { static let animal = Animal() }`: any stored static on an enum.
denial_set contains finding(decl) if {
  some decl in input.enumDecls
  some member in members(decl)
  stored_static(member)
}

# `/// The FOAF vocabulary.` before `enum Friend { case knows }`
denial_set contains finding(decl) if {
  some decl in input.enumDecls
  vocabulary_documentation(decl)
  some member in members(decl)
  container_member(member)
}

# `extension Foaf { static let knows = Knows() }`, `struct Schema { static let
# name = ... }`: a stored static on a type named or documented as a vocabulary.
denial_set contains finding(decl) if {
  some decl in other_groups
  vocabulary_type(decl)
  some member in members(decl)
  stored_static(member)
}

# `enum Relation { case knows, person, agent }`, `enum Social: String { case
# knows, person }`: a case-only enum most of whose cases name terms of a
# published vocabulary. `CodingKeys` name a type's own properties and are
# not term containers.
denial_set contains finding(decl) if {
  some decl in input.enumDecls
  not coding_keys(decl)
  names := case_names(decl)
  count(names) >= 2
  count(members(decl)) == count([member | some member in members(decl); member.enumCaseDecl])
  terms := [name | some name in names; lower(name) in vocabulary_terms]
  count(terms) * 2 > count(names)
}

denial_set contains finding(decl) if {
  some decl in input.enumDecls
  inherits(decl, "String")
  not inherits(decl, "CodingKey")
  some member in members(decl)
  term_raw_value(member)
}

denial_set contains finding(decl) if {
  some decl in other_groups
  some member in members(decl)
  term_constant(member)
}

# The structs, classes, actors and extensions of the file.
other_groups contains decl if some decl in input.structDecls

other_groups contains decl if some decl in input.classDecls

other_groups contains decl if some decl in input.actorDecls

other_groups contains decl if some decl in input.extensionDecls

finding(decl) := {
  "rule_id": "semantickit.design_guidelines.no_static_term_enum",
  "message": message,
  "line": decl.range.start.line,
  "column": decl.range.start.column,
  "severity": "error",
}

# The declarations directly inside the type's member block.
members(decl) := [member.decl | some member in decl.memberBlock.members]

enum_term_constant(member) if term_constant(member)

# `static let knows: Property`, `static var person: Class { ... }`
enum_term_constant(member) if {
  variable := member.variableDecl
  is_static(variable)
  not iri_valued(variable)
  some binding in variable.bindings
  type_name(binding.typeAnnotation.type) in term_kinds
}

# `enum FoafTerm`, `enum FoafVocabulary`, `enum Properties`, `enum Foaf`,
# `enum RDFS`.
term_container_name(name) if regex.match(`(Term|Terms|Vocabulary|Vocabularies|Vocab|Ontology|Ontologies|Namespace|NS|Property|Properties|Predicate|Predicates|Class|Classes|Concept|Concepts)$`, name)

term_container_name(name) if lower(name) in vocabulary_prefixes

vocabulary_type(decl) if term_container_name(decl.name)

vocabulary_type(decl) if vocabulary_documentation(decl)

vocabulary_type(decl) if vocabulary_name(decl.extendedType.identifierType.name)

vocabulary_name(name) if regex.match(`(Term|Terms|Vocabulary|Vocabularies|Vocab|Ontology|Ontologies|Namespace|NS|Properties|Predicates|Classes|Concepts)$`, name)

vocabulary_name(name) if lower(name) in vocabulary_prefixes

# The declaration's documentation names a vocabulary, an ontology or a
# namespace: `/// The FOAF vocabulary.`
vocabulary_documentation(decl) if regex.match(`(?i)\b(vocabular(y|ies)|ontolog(y|ies)|namespaces?)\b`, decl.documentation)

# The prefixes of published vocabularies: the W3C RDFa initial context, and the
# vocabularies Solid, WebID and ActivityPub use.
vocabulary_prefixes := {
  "as", "acl", "cc", "cert", "csvw", "ctag", "dc", "dcat", "dcterms", "dct", "doap",
  "dqv", "duv", "foaf", "geo", "gr", "grddl", "ical", "interact", "ldp", "ma",
  "oa", "odrl", "og", "org", "owl", "pim", "prov", "qb", "rdf", "rdfa", "rdfs",
  "rev", "rif", "rr", "schema", "sd", "sh", "shacl", "sioc", "skos", "skosxl",
  "solid", "sosa", "ssn", "time", "vcard", "void", "wdr", "wdrs", "xhv", "xml",
  "xsd", "activitystreams",
}

coding_keys(decl) if decl.name == "CodingKeys"

coding_keys(decl) if inherits(decl, "CodingKey")

case_names(decl) := [element.name | some member in members(decl); some element in member.enumCaseDecl.elements]

# Local names of the published vocabularies' classes and properties, in lower
# case, that are not also everyday Swift words: FOAF, RDF, RDFS, OWL, SKOS,
# ACL, Solid, LDP, cert, vCard and ActivityStreams.
vocabulary_terms := {
  # FOAF
  "knows", "person", "agent", "organization", "mbox", "mboxsha1sum",
  "homepage", "nick", "depiction", "img", "interest", "topicinterest",
  "onlineaccount", "accountname", "accountservicehomepage", "givenname",
  "familyname", "firstname", "lastname", "weblog", "workplacehomepage",
  "schoolhomepage", "primarytopic", "isprimarytopicof", "maker", "made",
  "openid", "membershipclass", "basednear",
  # RDF, RDFS
  "subclassof", "subpropertyof", "domain", "range", "seealso", "isdefinedby",
  "langstring", "plainliteral", "xmlliteral",
  # OWL
  "sameas", "differentfrom", "equivalentclass", "equivalentproperty",
  "inverseof", "disjointwith", "thing", "nothing", "imports", "versioninfo",
  "versioniri", "priorversion", "objectproperty", "datatypeproperty",
  "annotationproperty", "namedindividual", "restriction", "onproperty",
  "somevaluesfrom", "allvaluesfrom", "hasvalue", "mincardinality",
  "maxcardinality", "cardinality", "unionof", "intersectionof", "complementof",
  "oneof", "functionalproperty", "inversefunctionalproperty",
  "transitiveproperty", "symmetricproperty",
  # SKOS
  "concept", "conceptscheme", "preflabel", "altlabel", "hiddenlabel",
  "broader", "narrower", "inscheme", "topconceptof",
  "hastopconcept", "exactmatch", "closematch", "broadmatch", "narrowmatch",
  # ACL, Solid, LDP, cert
  "authorization", "accessto", "agentclass", "agentgroup", "accesscontrol",
  "oidcissuer", "inbox", "outbox", "webid", "basiccontainer",
  "directcontainer", "indirectcontainer", "rsapublickey", "modulus",
  "exponent",
  # vCard, ActivityStreams
  "hasemail", "hastelephone", "hasaddress", "fn", "followers", "following",
  "liked", "attributedto", "inreplyto",
}

# A stored static property: `static let`, or `static var` with a value and no
# accessors.
stored_static(member) if {
  variable := member.variableDecl
  is_static(variable)
  not iri_valued(variable)
  some binding in variable.bindings
  not binding.accessorBlock
}

container_member(member) if member.enumCaseDecl

container_member(member) if {
  variable := member.variableDecl
  is_static(variable)
  not iri_valued(variable)
}

container_member(member) if {
  is_static(member.functionDecl)
  not iri_function(member.functionDecl)
}

# `case knows = "http://xmlns.com/foaf/0.1/knows"`, `case knows = "foaf:knows"`,
# `case animal = "Animal"`
term_raw_value(member) if {
  some element in member.enumCaseDecl.elements
  text := string_literal_text(element.rawValue.value)
  term_string(text, element.name)
}

term_string(text, _) if iri_string(text)

# The case's own name, as a class's local name: `animal` = "Animal".
term_string(text, name) if {
  text != name
  lower(text) == lower(name)
  regex.match(`^[A-Z]`, text)
}

# "http://xmlns.com/foaf/0.1/knows", "foaf:knows"
iri_string(text) if regex.match(`^[A-Za-z][A-Za-z0-9+.-]*:[^\s]+$`, text)

# `static let knows = Term("knows")`, `static let knows = "knows"`
term_constant(member) if {
  variable := member.variableDecl
  is_static(variable)
  not iri_valued(variable)
  some binding in variable.bindings
  some form in forms(binding.initializer.value)
  term_value(form, binding_name(binding))
}

term_constant(member) if term_function(member.functionDecl)

# `static func knows() -> Term`: a term constant spelled as a function. A
# static function that takes parameters, such as a decoder's
# `static func term(from token: String) -> Term`, turns its arguments into a
# term and is not a constant.
term_function(function) if {
  is_static(function)
  not function.signature.parameterClause.parameters
  type_name(function.signature.returnClause.type) in term_kinds
}

term_value(value, _) if iri_string(string_literal_text(value))

# `static let knows = "knows"`: the term's name as its value.
term_value(value, name) if string_literal_text(value) == name

term_value(value, _) if callee_name(value.functionCallExpr) in term_kinds

# `Term.named("knows")`, `RDFKit.Property.make("knows")`: a static factory of
# a term kind.
term_value(value, _) if {
  access := value.functionCallExpr.calledExpression.memberAccessExpr
  access.declName.baseName != "init"
  reference_name(access.base) in term_kinds
}

# `static let friend = Knows()`: an instance of a type named after a
# vocabulary term.
term_value(value, _) if {
  callee := callee_name(value.functionCallExpr)
  regex.match(`^[A-Z]`, callee)
  lower(callee) in vocabulary_terms
}

# `static let animal = Animal()`: an instance of the type the constant names.
term_value(value, name) if {
  callee := callee_name(value.functionCallExpr)
  name != ""
  lower(callee) == lower(name)
  callee != name
}

is_static(decl) if {
  some modifier in decl.modifiers
  modifier.name in {"static", "class"}
}

# `enum X: String`, `enum X: Swift.String, Sendable`, `enum CodingKeys: String, CodingKey`
inherits(decl, name) if {
  some inherited in decl.inheritanceClause.inheritedTypes
  type_name(inherited.type) == name
}

binding_name(binding) := binding.pattern.identifierPattern.identifier

# The text of a string literal with one plain segment.
string_literal_text(expression) := segment.stringSegment.content if {
  [segment] := expression.stringLiteralExpr.segments
}

type_name(type) := type.identifierType.name

type_name(type) := type.memberType.name

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

reference_name(expression) := expression.declReferenceExpr.baseName

reference_name(expression) := expression.memberAccessExpr.declName.baseName

# The statics `no_static_iri_constant` reports: typed as an identifier, or
# valued with an identifier's initializer or factory, an IRI string, an
# interpolated string, a `+` with a string or a namespace, a string-building
# call or a URL path call. Kept in step with that policy, so that one static
# is reported once.
iri_valued(variable) if {
  some binding in variable.bindings
  iri_binding(binding)
}

iri_binding(binding) if identifier_type(binding.typeAnnotation.type)

iri_binding(binding) if {
  some value in {value | value := binding.initializer.value} | {block | block := binding.accessorBlock}
  iri_value(value)
}

# A static function without parameters returning an identifier built as
# above: `no_static_iri_constant`'s.
iri_function(function) if {
  not function.signature.parameterClause.parameters
  identifier_type(function.signature.returnClause.type)
  iri_value(function.body)
}

identifier_type(type) if named_identifier(type)

identifier_type(type) if named_identifier(type.optionalType.wrappedType)

identifier_type(type) if named_identifier(type.implicitlyUnwrappedOptionalType.wrappedType)

named_identifier(type) if type_name(type) in identifier_types

identifier_types := {"IRI", "URL", "URI", "NamedNode", "IRIRef"}

iri_value(value) if {
  walk(value, [_, node])
  callee_name(node.functionCallExpr) in identifier_types
}

iri_value(value) if {
  walk(value, [_, node])
  access := node.memberAccessExpr
  access.declName.baseName != "init"
  reference_name(access.base) in identifier_types
}

iri_value(value) if {
  walk(value, [_, node])
  iri_string(node.stringLiteralExpr.segments[0].stringSegment.content)
}

iri_value(value) if {
  walk(value, [_, node])
  node.expressionSegment
}

iri_value(value) if {
  walk(value, [_, node])
  operation := node.infixOperatorExpr
  operation.operator.binaryOperatorExpr.operator == "+"
  some operand in [operation.leftOperand, operation.rightOperand]
  string_or_namespace(operand)
}

iri_value(value) if {
  walk(value, [_, node])
  call := node.functionCallExpr
  string_building_call(call)
  walk(call, [_, literal])
  literal.stringLiteralExpr
}

iri_value(value) if {
  walk(value, [_, node])
  node.functionCallExpr.calledExpression.memberAccessExpr.declName.baseName in {"appending", "appendingPathComponent", "appendingPathExtension"}
}

string_or_namespace(operand) if operand.stringLiteralExpr

string_or_namespace(operand) if namespace_reference(operand)

namespace_reference(reference) if namespace_name(reference.declReferenceExpr.baseName)

namespace_reference(reference) if namespace_name(reference.memberAccessExpr.declName.baseName)

namespace_name(name) if lower(name) in {"ns", "namespace", "iri", "uri", "url", "vocab", "vocabulary"}

namespace_name(name) if regex.match(`[a-z0-9](Namespace|NS|IRI|Iri|URI|Uri|URL|Url)$`, name)

# `ns.appending("knows")`, `[ns, "knows"].joined()`, `String(format: "%@knows",
# ns)`: a string built by a call rather than by `+`.
string_building_call(call) if call.calledExpression.memberAccessExpr.declName.baseName == "joined"

string_building_call(call) if {
  call.calledExpression.memberAccessExpr.declName.baseName == "appending"
  [argument] := call.arguments
  not argument.label
}

string_building_call(call) if {
  call.calledExpression.declReferenceExpr.baseName == "String"
  call.arguments[0].label == "format"
}
