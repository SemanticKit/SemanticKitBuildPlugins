import Foundation
import Testing

/// The Rego tests of every policy library, run by `opa test` as part of
/// `swift test`.
@Suite("Rego policy tests", .tags(.opa))
struct RegoPolicyTests {
    @Test("Every policy's Rego tests pass over their passing and failing samples")
    func regoTestsPass() throws {
        let output = try Repository.run(try Repository.opa, [
            "test", "--format", "json",
            Repository.url("Sources").path,
            Repository.url("Tests/Rego").path,
        ])
        let results = try #require(try JSONSerialization.jsonObject(with: output) as? [[String: Any]])
        #expect(results.count > 300)
        let failed = results.filter { $0["fail"] as? Bool == true || $0["error"] != nil }.compactMap { $0["name"] as? String }
        #expect(failed.isEmpty, "\(failed)")
    }
}
