import AST
import Foundation
import Rego


struct EvaluationFinding: Decodable {
    let rule_id: String
    let message: String
    let line: Int
    let column: Int
    let severity: String
}

@main
struct RegoPolicyEvaluateTool {
    static func main() async {
        var source: String?
        var bundles: [String] = []
        var arguments = CommandLine.arguments.dropFirst().makeIterator()

        while let argument = arguments.next() {
            switch argument {
            case "--source":
                guard let value = arguments.next(), !value.hasPrefix("--") else {
                    FileHandle.standardError.write(Data("missing value for --source\n".utf8))
                    exit(2)
                }
                source = value
            case "--bundle":
                guard let value = arguments.next(), !value.hasPrefix("--") else {
                    FileHandle.standardError.write(Data("missing value for --bundle\n".utf8))
                    exit(2)
                }
                bundles.append(value)
            default:
                FileHandle.standardError.write(Data("unknown argument: \(argument)\n".utf8))
                exit(2)
            }
        }

        guard let source else {
            FileHandle.standardError.write(Data("missing --source\n".utf8))
            exit(2)
        }

        do {
            let findings = try await evaluate(source: source, bundles: bundles)
            for finding in findings {
                let severity = finding.severity == "error" ? "error" : "warning"
                print("\(source):\(finding.line):\(finding.column): \(severity): \(finding.message)")
            }
        } catch {
            FileHandle.standardError.write(Data("\(error)\n".utf8))
            exit(1)
        }
    }

    static func swiftAST(from source: String) throws -> Data {
        let process = Process()
        let output = Pipe()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        process.arguments = ["swiftc", "-dump-parse", "-dump-ast-format", "json", source]
        process.standardOutput = output
        process.standardError = FileHandle.standardError
        try process.run()
        let data = output.fileHandleForReading.readDataToEndOfFile()
        process.waitUntilExit()
        guard process.terminationStatus == 0 else { exit(process.terminationStatus) }
        return data
    }

    static func evaluate(source: String, bundles: [String]) async throws -> [EvaluationFinding] {
        let input = try AST.RegoValue(jsonData: swiftAST(from: source))
        let bundlePaths = bundles.map {
            Rego.OPA.Engine.BundlePath(name: $0, url: URL(fileURLWithPath: $0))
        }
        var engine = Rego.OPA.Engine(bundlePaths: bundlePaths)
        let query = try await engine.prepareForEvaluation(query: "data")
        let data = try JSONEncoder().encode(try await query.evaluate(input: input))
        return try JSONDecoder().decode([EvaluationFinding].self, from: data)
    }
}
