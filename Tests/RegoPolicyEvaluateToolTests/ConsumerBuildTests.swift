import Foundation
import Testing

/// `swift build` of `Tests/PolicyConsumer`, a package that depends on the
/// policy libraries and applies `RegoPolicyEvaluate` as any other package
/// does: the build of `PolicyProbes` fails with the named rule of every
/// banned shape, and the build of `PolicyConsumer`, which holds the intended
/// shapes, passes. Both have the ontologies of `PolicyOntologies`, a target
/// they depend on, in scope.
@Suite("Consumer package build", .tags(.consumer, .invariants, .opa), .serialized)
struct ConsumerBuildTests {
    static let package = Repository.url("Tests/PolicyConsumer")

    /// The consumer's sources are the shapes `InvariantPolicyTests` checks,
    /// in `#if false` blocks: the policies read them, the compiler skips them.
    @Test("The consumer's probe, intended and ontology files are the shapes InvariantPolicyTests checks")
    func sourcesMatch() throws {
        let banned = InvariantPolicyTests.banned.map(\.swift).joined(separator: "\n")
        #expect(try Self.source("PolicyProbes/Banned.swift") == Self.skipped(banned))
        #expect(try Self.source("PolicyConsumer/Intended.swift") == Self.skipped(InvariantPolicyTests.intended))
        #expect(try Self.source("PolicyOntologies/Ontologies.swift") == Self.skipped(InvariantPolicyTests.vocabulary))
    }

    @Test("Building a target with every banned shape fails with the rule that names each one")
    func probesFail() throws {
        let build = try Self.build("PolicyProbes")

        #expect(build.status != 0)
        let file = Self.package.appendingPathComponent("Sources/PolicyProbes/Banned.swift").path
        let found = Set(build.output.split(separator: "\n").compactMap { line -> String? in
            guard line.hasPrefix(file + ":"), line.contains(": error: "),
                  let rule = line.split(separator: "[").last?.dropLast()
            else { return nil }
            let position = line.dropFirst(file.count + 1).split(separator: ":").prefix(2).joined(separator: ":")
            return "\(position) \(rule)"
        })
        // Line 1 is `#if false`.
        let expected = Set(InvariantPolicyTests.banned.enumerated().map { index, shape in
            "\(index + 2):\(shape.column) semantickit.design_guidelines.\(shape.rule)"
        })
        #expect(found == expected, "missing: \(expected.subtracting(found).sorted()), unexpected: \(found.subtracting(expected).sorted())")
    }

    @Test("Building the same package with the intended shapes passes")
    func intendedPasses() throws {
        let build = try Self.build("PolicyConsumer")

        #expect(build.status == 0, "\(build.output)")
        // PolicyTriggers.swift prints the warn and note rules; no rule denies.
        let denials = build.output.split(separator: "\n").filter { $0.contains(": error: ") && $0.contains("[semantickit.design_guidelines.") }
        #expect(denials.isEmpty, "\(denials)")
    }

    private static func skipped(_ swift: String) -> String {
        "#if false\n\(swift)\n#endif\n"
    }

    private static func source(_ path: String) throws -> String {
        try String(contentsOf: package.appendingPathComponent("Sources").appendingPathComponent(path), encoding: .utf8)
    }

    /// Runs `swift build --target <target>` in the consumer package and
    /// returns its exit status and its output.
    private static func build(_ target: String) throws -> (status: Int32, output: String) {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        process.arguments = ["swift", "build", "--package-path", package.path, "--target", target]
        let output = Pipe()
        process.standardOutput = output
        process.standardError = output
        try process.run()
        let data = output.fileHandleForReading.readDataToEndOfFile()
        process.waitUntilExit()
        return (process.terminationStatus, String(decoding: data, as: UTF8.self))
    }
}
