import AST
import Foundation
import Rego

/// Evaluates Swift source files against Rego policies.
///
/// Each policy is planned on its own with `opa build --target plan`. Each
/// syntax node of each file is then the `input` of every policy's
/// `decision` in turn, so a policy matches the node it describes
/// (`input.type == "FunctionCallExprSyntax"`, `input.children[0]`, ...).
/// Each finding prints as a build diagnostic; a `deny` finding exits with
/// status 1.
@main
struct RegoPolicyEvaluateTool {
    static func main() async {
        var opa: String?
        var plansDirectory: String?
        var record: String?
        var policies: [String] = []
        var sources: [String] = []
        var arguments = CommandLine.arguments.dropFirst().makeIterator()

        while let argument = arguments.next() {
            guard ["--opa", "--plans", "--record", "--policy", "--source"].contains(argument) else {
                fail("unknown argument: \(argument)", status: 2)
            }
            guard let value = arguments.next(), !value.hasPrefix("--") else {
                fail("missing value for \(argument)", status: 2)
            }
            switch argument {
            case "--opa": opa = value
            case "--plans": plansDirectory = value
            case "--record": record = value
            case "--policy": policies.append(value)
            default: sources.append(value)
            }
        }

        guard let opa, let plansDirectory else {
            fail(
                "usage: RegoPolicyEvaluateTool --opa <opa> --plans <dir> [--record <file.swift>] --policy <file.rego>... --source <file.swift>...",
                status: 2
            )
        }

        do {
            let bundles = try await PolicyPlanner(
                opa: URL(fileURLWithPath: opa),
                directory: URL(fileURLWithPath: plansDirectory, isDirectory: true)
            ).plan(policies.map { URL(fileURLWithPath: $0) })
            let evaluation = try await PolicyEvaluation(bundles: bundles)

            var findingCount = 0
            var denied = false
            for source in sources {
                let nodes = try SyntaxInput(contentsOf: URL(fileURLWithPath: source)).nodes
                for finding in try await evaluation.findings(for: nodes) {
                    print("\(source):\(finding.line):\(finding.column): \(finding.level.rawValue): \(finding.message) [\(finding.ruleID)]")
                    findingCount += 1
                    denied = denied || finding.level == .error
                }
            }
            if let record {
                let summary = "// \(findingCount) Rego policy finding(s) in \(sources.count) file(s)\n"
                try Data(summary.utf8).write(to: URL(fileURLWithPath: record), options: [.atomic])
            }
            if denied {
                exit(1)
            }
        } catch {
            fail("error: \(error)", status: 1)
        }
    }

    static func fail(_ message: String, status: Int32) -> Never {
        FileHandle.standardError.write(Data("\(message)\n".utf8))
        exit(status)
    }
}
