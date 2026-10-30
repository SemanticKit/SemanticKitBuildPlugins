import Foundation

/// Plans Rego policies and evaluates Swift source files against them.
///
/// ```text
/// RegoPolicyEvaluateTool plan --opa <opa> --plans <dir> --record <file.swift> --policy <file.rego>...
/// RegoPolicyEvaluateTool evaluate --plans <dir> --record <file.swift> --source <file.swift>...
/// RegoPolicyEvaluateTool input --source <file.swift>
/// ```
///
/// `plan` plans each policy on its own with `opa build --target plan` into
/// `<dir>`. `evaluate` gives each source file, as ``SyntaxInput``, to the
/// `decision` of every planned policy, which reads the nodes it describes by
/// their swift-syntax properties (`some call in input.functionCallExprs`,
/// `call.calledExpression.declReferenceExpr.baseName`, ...). Each finding
/// prints as a build diagnostic; a `deny` finding exits with status 1.
/// `--record` names a Swift file that gets a one-line comment, the output
/// SwiftPM tracks; it is rewritten only when the line changes. `input`
/// prints the `input` a policy gets for a file as JSON, for writing policies
/// and their tests.
@main
struct RegoPolicyEvaluateTool {
    static func main() async {
        let result = await run(Array(CommandLine.arguments.dropFirst()))
        for line in result.diagnostics {
            print(line)
        }
        exit(result.status)
    }

    /// Runs one command and returns its exit status, 0, 1 for a `deny`
    /// finding or a failure, 2 for a usage error, with the diagnostics it
    /// prints.
    static func run(_ arguments: [String]) async -> (status: Int32, diagnostics: [String]) {
        var diagnostics: [String] = []
        let status = await run(arguments) { diagnostics.append($0) }
        return (status, diagnostics)
    }

    private static func run(_ arguments: [String], output: (String) -> Void) async -> Int32 {
        let usage = """
            usage: RegoPolicyEvaluateTool plan --opa <opa> --plans <dir> --record <file.swift> --policy <file.rego>...
                   RegoPolicyEvaluateTool evaluate --plans <dir> --record <file.swift> --source <file.swift>...
                   RegoPolicyEvaluateTool input --source <file.swift>
            """
        guard let command = arguments.first, ["plan", "evaluate", "input"].contains(command) else {
            return failure(usage, status: 2)
        }
        var options: [String: [String]] = [:]
        var remaining = arguments.dropFirst().makeIterator()
        let names = switch command {
        case "plan": ["--opa", "--plans", "--record", "--policy"]
        case "evaluate": ["--plans", "--record", "--source"]
        default: ["--source"]
        }
        while let name = remaining.next() {
            guard names.contains(name) else {
                return failure("unknown argument: \(name)\n\(usage)", status: 2)
            }
            guard let value = remaining.next(), !value.hasPrefix("--") else {
                return failure("missing value for \(name)", status: 2)
            }
            options[name, default: []].append(value)
        }
        if command == "input" {
            guard let source = options["--source"]?.last else { return failure(usage, status: 2) }
            do {
                let encoder = JSONEncoder()
                encoder.outputFormatting = [.sortedKeys, .withoutEscapingSlashes]
                let input = try SyntaxInput(contentsOf: URL(fileURLWithPath: source)).value
                output(String(decoding: try encoder.encode(input), as: UTF8.self))
                return 0
            } catch {
                return failure("error: \(error)", status: 1)
            }
        }
        guard let plans = options["--plans"]?.last.map({ URL(fileURLWithPath: $0, isDirectory: true) }),
              let record = options["--record"]?.last.map({ URL(fileURLWithPath: $0) })
        else {
            return failure(usage, status: 2)
        }

        do {
            if command == "plan" {
                guard let opa = options["--opa"]?.last else { return failure(usage, status: 2) }
                let policies = (options["--policy"] ?? []).map { URL(fileURLWithPath: $0) }
                let bundles = try await PolicyPlanner(opa: URL(fileURLWithPath: opa), directory: plans).plan(policies)
                try write("// \(bundles.count) Rego policies planned\n", to: record)
                return 0
            }

            let evaluation = try await PolicyEvaluation(plansIn: plans)
            let sources = options["--source"] ?? []
            var findingCount = 0
            var denied = false
            for source in sources {
                for finding in try await evaluation.findings(in: SyntaxInput(contentsOf: URL(fileURLWithPath: source))) {
                    output(finding.diagnostic(in: source))
                    findingCount += 1
                    denied = denied || finding.level == .error
                }
            }
            try write("// \(findingCount) Rego policy finding(s) in \(sources.count) file(s)\n", to: record)
            return denied ? 1 : 0
        } catch {
            return failure("error: \(error)", status: 1)
        }
    }

    /// Writes `line` to `file` unless the file already holds it, so an
    /// unchanged record does not make SwiftPM compile it again.
    private static func write(_ line: String, to file: URL) throws {
        let data = Data(line.utf8)
        guard (try? Data(contentsOf: file)) != data else { return }
        try FileManager.default.createDirectory(at: file.deletingLastPathComponent(), withIntermediateDirectories: true)
        try data.write(to: file, options: [.atomic])
    }

    private static func failure(_ message: String, status: Int32) -> Int32 {
        FileHandle.standardError.write(Data("\(message)\n".utf8))
        return status
    }
}
