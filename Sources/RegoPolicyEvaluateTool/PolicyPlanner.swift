import Foundation

/// Plans each Rego policy into its own plan bundle with
/// `opa build --target plan`, one `opa` process per policy, run together.
///
/// Each bundle is unpacked into its own `<n>-<policy>.plan` directory in
/// `directory`. The bundles replace every `*.plan` directory already there,
/// so a deleted policy leaves no plan behind.
struct PolicyPlanner {
    let opa: URL
    let directory: URL

    func plan(_ policies: [URL]) async throws -> [PlanBundle] {
        let files = FileManager.default
        try files.createDirectory(at: directory, withIntermediateDirectories: true)
        for stale in try files.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil)
            where stale.lastPathComponent.hasSuffix(".plan")
        {
            try files.removeItem(at: stale)
        }
        return try await withThrowingTaskGroup(of: (Int, PlanBundle).self) { group in
            for (index, policy) in policies.enumerated() {
                let bundle = directory.appendingPathComponent("\(String(format: "%04d", index))-\(policy.deletingPathExtension().lastPathComponent).plan")
                group.addTask {
                    let archive = bundle.appendingPathExtension("tar.gz")
                    try Self.run(opa, ["build", "--target", "plan", "--output", archive.path, policy.path])
                    defer { try? FileManager.default.removeItem(at: archive) }
                    return (index, try PlanBundle.unpack(archive, into: bundle))
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
