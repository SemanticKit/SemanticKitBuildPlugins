import AST
import Foundation
import Rego

/// Evaluates one Swift source file against policy plan bundles.
///
/// Each syntax node of the file is the `input` of every policy's `decision`
/// in turn, so a policy matches the node it describes (`input.type ==
/// "FunctionCallExprSyntax"`, `input.children[0]`, ...). Each finding prints
/// as a build diagnostic. A `deny` finding exits with status 1.
@main
struct RegoPolicyEvaluateTool {
    static func main() async {
        var source: String?
        var record: String?
        var bundles: [String] = []
        var arguments = CommandLine.arguments.dropFirst().makeIterator()

        while let argument = arguments.next() {
            guard ["--source", "--record", "--bundle"].contains(argument) else {
                fail("unknown argument: \(argument)", status: 2)
            }
            guard let value = arguments.next(), !value.hasPrefix("--") else {
                fail("missing value for \(argument)", status: 2)
            }
            switch argument {
            case "--source": source = value
            case "--record": record = value
            default: bundles.append(value)
            }
        }

        guard let source else {
            fail("usage: RegoPolicyEvaluateTool --source <file.swift> [--record <file.swift>] --bundle <plan.tar.gz>...", status: 2)
        }

        do {
            let sourceURL = URL(fileURLWithPath: source)
            let nodes = try SyntaxInput(contentsOf: sourceURL).nodes
            let findings = try await PolicyEvaluation(
                bundles: bundles.map { try PlanBundle(contentsOf: URL(fileURLWithPath: $0)) }
            ).findings(for: nodes)

            for finding in findings {
                print("\(source):\(finding.line):\(finding.column): \(finding.level.rawValue): \(finding.message) [\(finding.ruleID)]")
            }
            if let record {
                let summary = "// \(findings.count) Rego policy finding(s) in \(sourceURL.lastPathComponent)\n"
                try Data(summary.utf8).write(to: URL(fileURLWithPath: record), options: [.atomic])
            }
            if findings.contains(where: { $0.level == .error }) {
                exit(1)
            }
        } catch {
            fail("\(source): error: \(error)", status: 1)
        }
    }

    static func fail(_ message: String, status: Int32) -> Never {
        FileHandle.standardError.write(Data("\(message)\n".utf8))
        exit(status)
    }
}
