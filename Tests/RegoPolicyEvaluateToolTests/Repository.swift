import Foundation

/// Paths in this repository and the `opa` CLI the tests run.
enum Repository {
    static let root = URL(fileURLWithPath: #filePath)
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .deletingLastPathComponent()

    static func url(_ path: String) -> URL {
        root.appendingPathComponent(path)
    }

    /// The first `opa` on `PATH`, then `~/.local/bin/opa`, as the plugins look for it.
    static var opa: URL {
        get throws {
            let environment = ProcessInfo.processInfo.environment
            var directories = (environment["PATH"] ?? "").split(separator: ":").map(String.init)
            if let home = environment["HOME"] {
                directories.append("\(home)/.local/bin")
            }
            for directory in directories {
                let candidate = URL(fileURLWithPath: directory).appendingPathComponent("opa")
                if FileManager.default.isExecutableFile(atPath: candidate.path) {
                    return candidate
                }
            }
            throw OpaNotFound()
        }
    }

    /// A new empty directory under the system's temporary directory.
    static func temporaryDirectory() throws -> URL {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent("RegoPolicyEvaluateToolTests-\(UUID().uuidString)", isDirectory: true)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        return directory
    }

    /// Runs `executable` and returns its standard output.
    static func run(_ executable: URL, _ arguments: [String]) throws -> Data {
        let process = Process()
        process.executableURL = executable
        process.arguments = arguments
        let output = Pipe()
        process.standardOutput = output
        try process.run()
        let data = output.fileHandleForReading.readDataToEndOfFile()
        process.waitUntilExit()
        guard process.terminationStatus == 0 else {
            throw CommandFailed(arguments: arguments, status: process.terminationStatus)
        }
        return data
    }
}

private struct OpaNotFound: Error, CustomStringConvertible {
    var description: String { "opa not found on PATH or in ~/.local/bin" }
}

private struct CommandFailed: Error, CustomStringConvertible {
    let arguments: [String]
    let status: Int32

    var description: String { "\(arguments.joined(separator: " ")) exited with \(status)" }
}
