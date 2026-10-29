import Foundation

/// Plans each Rego policy into its own plan bundle with
/// `opa build --target plan`, one `opa` process per policy, run together.
struct PolicyPlanner {
    let opa: URL
    let directory: URL

    func plan(_ policies: [URL]) async throws -> [PlanBundle] {
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        return try await withThrowingTaskGroup(of: (Int, PlanBundle).self) { group in
            for (index, policy) in policies.enumerated() {
                let output = directory.appendingPathComponent("\(index)-\(policy.deletingPathExtension().lastPathComponent).plan.tar.gz")
                group.addTask {
                    try Self.run(opa, ["build", "--target", "plan", "--output", output.path, policy.path])
                    return (index, try PlanBundle(contentsOf: output))
                }
            }
            var bundles: [(Int, PlanBundle)] = []
            for try await bundle in group {
                bundles.append(bundle)
            }
            return bundles.sorted { $0.0 < $1.0 }.map(\.1)
        }
    }

    private static func run(_ executable: URL, _ arguments: [String]) throws {
        let process = Process()
        process.executableURL = executable
        process.arguments = arguments
        let errors = Pipe()
        process.standardError = errors
        try process.run()
        let message = errors.fileHandleForReading.readDataToEndOfFile()
        process.waitUntilExit()
        guard process.terminationStatus == 0 else {
            throw PlanFailed(arguments: arguments, message: String(decoding: message, as: UTF8.self))
        }
    }
}

private struct PlanFailed: Error, CustomStringConvertible {
    let arguments: [String]
    let message: String

    var description: String {
        "opa \(arguments.joined(separator: " ")) failed: \(message)"
    }
}
