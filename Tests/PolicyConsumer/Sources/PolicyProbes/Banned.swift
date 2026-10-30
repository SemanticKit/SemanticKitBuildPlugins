#if false
enum Foaf { static let knows = Term("knows") }
struct ACL { static let readClass = IRI("http://www.w3.org/ns/auth/acl#Read") }
var terms: [IRI: Term] = [:]
final class TermRegistry {}
let iri = IRI(rawValue: "\(namespace)\(name)")
let graph = IndividualGraph()
let keys = Cert.key.values(of: alice)
let foo = Class("Foo").addLabel("Foo").addComment("A foo.")
let domain = Domain("Animal")
enum FoafTerm: String { case knows, person }
extension Foaf { static let knows = Term("knows") }
struct Foaf { static let knows = Property("knows") }
enum Foaf { static func knows() -> Term { Term() } }
struct ACL { static let readClass = try! IRI(validating: "http://www.w3.org/ns/auth/acl#Read") }
struct ACL { static let readClass: IRI? = nil }
var terms = Dictionary<IRI, Term>()
var terms = [IRI: Term].init()
var terms: [Swift.String: Term] = [:]
var terms: Swift.Dictionary<IRIKit.IRI, Term> = [:]
let keys = values(of: alice)
let mode = ACL.readClass
let domain = Domain(Fauna.Animal.iri)
let range = Range(try! IRI(validating: "http://example.org/fauna#Habitat"))
let terms = ["knows": Knows(), "name": Name()]
var byURL: [URL: Term] = [:]
let terms = [IRI("http://xmlns.com/foaf/0.1/knows"): Knows()]
let iri = IRI.init(rawValue: "\(namespace)\(name)")
let iri = IRIKit.IRI(rawValue: "\(namespace)\(name)")
let range = Range("http://www.w3.org/2001/XMLSchema#" + "nonNegativeInteger")
enum Foaf: String { case knows = "http://xmlns.com/foaf/0.1/knows" }
enum FoafA { static let knows = URL(string: "http://xmlns.com/foaf/0.1/knows")! }
enum FoafB { static let knows = "\(ns)knows" }
enum FoafC { static let knows = ns + "knows" }
struct FoafD { static let knows = NamedNode("http://xmlns.com/foaf/0.1/knows") }
enum Foaf { case knows, person, agent }
/** The FOAF vocabulary. */ enum Friend { case knows, person }
enum Fauna { static let animal = Animal() }
struct Fauna { static let namespace = Namespace("https://fauna.example.org/ontology#") }
extension Prefix { static let owl = Prefix("owl", "http://www.w3.org/2002/07/owl#") }
enum ACL { static var read: URL { URL(string: "http://www.w3.org/ns/auth/acl#Read")! } }
let r = TermRegistry.shared
let iri = URL(string: "\(base)knows")
let term = Term("http://example.org/" + name)
let knows = "\(namespace)knows"
struct Fauna: Ontology { func content() -> some Content { Namespace("https://fauna.example.org/ontology#") } }
let subclass = SubClassOf<Animal>()
let domain = Domain(Animal.self)
private func decodeTerm(_ token: String, tsvMode: Bool) throws -> ObjectTerm { fatalError() }
func parseLiteral(_ text: String, strict: Bool) -> Literal? { nil }
struct NTriplesParser { fileprivate func encodeTerm(_ term: Term, turtle: Bool) -> String { "" } }
struct TurtleParser { func resolve(_ local: String) -> IRI? { IRI(string: namespace + local) } }
let iri = IRI(string: ns.appending("knows"))
let iri = IRI(string: String(format: "%@knows", ns))
struct Paths { static let knows = [ns, "knows"].joined() }
let knows = IRI(rawValue: "http://xmlns.com/foaf/0.1/knows")
let knowsURL = URL(string: "http://xmlns.com/foaf/0.1/knows")!
func knows() -> IRI { IRI(rawValue: "http://xmlns.com/foaf/0.1/knows") }
struct Social { static let knows = IRI.foaf("knows") }
struct Social8 { static let knows = Term.named("knows") }
struct Social2 { static let knows = ns + local }
struct Social3 { static let knows = ns.appending(path: "knows") }
struct Social4 { static let knows = ns.appendingPathComponent("knows") }
extension Fauna.Animal { static var iri: IRI { Fauna.namespace.iri } }
let s = SubClassOf<Fauna.Animal>.init()
let p = SubPropertyOf<Fauna.knows>.init()
let d = Domain((Animal.self))
let d2 = Domain(Animal.self as Any.Type)
extension Person { init(from name: String) { self.id = IRI(rawValue: "\(ns)\(name)") } }
extension Person { func encode(to name: String) -> IRI { IRI(rawValue: "\(ns)\(name)") } }
private extension TSVParser { func decodeTerm(_ token: String, tsvMode: Bool) -> Term { fatalError() } }
func decodeTerm(_ token: String, tsvMode: Bool?) -> Term { fatalError() }
var byNode: [NamedNode: Term] = [:]
var byURI: [URI: Term] = [:]
var registry = [String: any Term.Type]()
var bySubstring: [Substring: Term] = [:]
enum Relation { case knows, person, agent }
enum Social5: String { case knows, person }
struct Social6 { static let friend = Knows() }
struct Social7 { static func knows() -> IRI { IRI(rawValue: "http://xmlns.com/foaf/0.1/knows") } }
let d3 = Domain.init(Animal.self)
let t1 = Type(Animal.self)
let t2 = Type("Animal")
let t3 = SeeAlso(Animal.self)
let t4 = IsDefinedBy("http://xmlns.com/foaf/0.1/")
let t5 = IRIAssertion<DomainDeclaration>(Animal.self)
func f1(name: String) -> IRI { var s = ns; s += name; return IRI(string: s)! }
func f2(name: String) -> IRI { var s = "http://xmlns.com/foaf/0.1/"; s.append(name); return IRI(string: s)! }
struct Person { let iri = IRI("http://xmlns.com/foaf/0.1/Person") }
struct Person2 { var iri: IRI { IRI("http://xmlns.com/foaf/0.1/Person") } }
final class Person3: Identifiable { var id: IRI { IRI("http://xmlns.com/foaf/0.1/Person") } }
enum Fauna { case animal, habitat, bird }
enum Kinds { case animal, habitat }
struct Fauna2: Ontology { var content: some Content { Namespace(ns) } }
struct Social9 { static let knows = prefix + local }
enum Social10 { static let knows = Foo(rawValue: base + name) }
let t6 = Type<Animal>()
let t7 = SeeAlso<Animal>()
let t8 = IsDefinedBy<Foaf>()
let t9 = Range(Habitat.self)
let t10 = SubClassOf(Animal.self)
let t11 = SubPropertyOf(knows.self)
let t12 = IsDefinedBy(Foaf.self)
let t13 = RDFKit.Domain(Animal.self)
let t14 = RDFKit.SeeAlso<Animal>()
final class Person4 { let iri: IRI }
struct Animal2 { var iri: IRI; let name: String }
final class Bird2: Identifiable { let id: IRI }
protocol Resource { var iri: IRI { get } }
final class Person5 { init(iri: IRI) {} }
let tweety = Bird(iri: identifier)
struct Zoo { let tweety = Fauna.Bird.init(iri: identifier) }
let foo2 = RDFKit.Class("Foo").addLabel("Foo")
let foo3 = Class.init("Foo").addLabel("Foo")
public struct TurtleDecoder2 { public func decode(_ text: String, strict: Bool) throws -> [Triple] { [] } }
extension NTriplesParser { func parseTerm(_ token: String, quoted: Bool) -> Term { fatalError() } }
let byIRI = Dictionary(uniqueKeysWithValues: people.map { ($0.iri, $0) })
var people: [String: Person] = [:]
var animals = [String: Fauna.Animal]()
struct Social11 { static let person = Person.self }
extension Zoo { static var animal: Any.Type { Fauna.Animal.self } }
final class Social12 { static let agent = Agent.self }
let byIRI2 = Dictionary(uniqueKeysWithValues: zip(people.map(\.iri), people))
let byIRI3 = Dictionary(grouping: people, by: \.iri)
let byIRI4 = people.reduce(into: [:]) { $0[$1.iri] = $1 }
final class Person6 { let iri: String }
struct TurtleDecoder4 { func decode(_ strict: Bool) throws {} }
func parseTerm(_ quoted: Bool, forKey key: String) -> Term { fatalError() }
final class Person7 { init(_ iri: String) {} }
#endif
