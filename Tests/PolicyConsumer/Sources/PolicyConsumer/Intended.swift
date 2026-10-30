#if false
struct Foaf: Ontology {}
struct ACL: Ontology {}
var counts: [Fauna.Habitat: Int] = [:]
final class Fauna {}
let graph = Graph()
let keys = alice.key
let foo = Class("Foo") { Label("Foo"); Comment("A foo.") }
let domain = Domain(Fauna.Animal)
enum TextDirection { case ltr, rtl }
extension Graph { static let empty = Graph() }
var counts = [Fauna.Habitat: Int]()
let mode = authorization.mode
let agentClass = authorization.agentClass
let range = Range(Fauna.Habitat)
struct Person: Codable { let name: String; enum CodingKeys: String, CodingKey { case name = "foaf_name" } }
public enum BaseDirection: String, Sendable, Codable { case ltr, rtl }
struct Format { static let mediaType = "text/turtle" }
var headers: [String: String] = [:]
let accept = ["Accept": "text/turtle"]
var tally: [String: Int] = [:]
let dataset = Dataset().addGraph(graph)
struct Fauna: Ontology { var body: some Content { Namespace("https://fauna.example.org/ontology#") } }
/** The base direction of a literal. */ enum Direction { case ltr, rtl }
enum Limits { static var depth: Int { 64 } }
let greeting = "Hello, \(name)"
let path = directory + "/file.txt"
let r = Range<Int>(uncheckedBounds: (0, 4))
let r2 = Range<String.Index>(range, in: text)
let r3 = Range(NSRange(location: 0, length: 2), in: "hello")
struct TurtleDecoder { func base() -> IRI { IRI(rawValue: "http://xmlns.com/foaf/0.1/")! } }
extension Person: Decodable { init(from decoder: any Decoder) throws { let iri = "\(namespace)alice" } }
struct Contact: Codable { let knows: [Contact]; let person: String; enum CodingKeys: String, CodingKey { case knows, person } }
enum TriplePosition { case subject, predicate, object }
func baseURL() -> URL { configuration.url }
let cache = FileManager.default.temporaryDirectory.appending(path: "cache")
enum Sort { case name, date }
let subclass = SubClassOf(Fauna.Animal)
func content(of url: URL) -> Data { Data() }
struct TurtleDecoder { func resolve(_ local: String) -> IRI? { IRI(string: namespace + local) } }
extension NTriplesEncoder { func subject(_ name: String) -> String { return "\(ns)\(name)" } }
extension Person: Encodable { func encode(to encoder: Encoder) throws { let iri = "\(namespace)alice" } }
extension ObjectTerm { init(token: String) throws { fatalError() } }
struct TSVDecoder { func decode(_ text: String) throws -> [ObjectTerm] { [] } }
struct NTriplesDecoder { static func term(from token: String) throws -> Term { fatalError() } }
let names = ["a", "b"].joined(separator: ", ")
let file = url.appending(path: "file.txt")
let path = directory.appending("/file.txt")
enum Axis { case domain, range }
func query(_ terms: [String]) -> String { var text = ""; for term in terms { text += term }; return text }
struct Person { let name: String; var greeting: String { "Hello, " + name } }
struct Totals { static let total = a + b }
#endif
