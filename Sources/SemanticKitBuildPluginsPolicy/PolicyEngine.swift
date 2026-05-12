import AST
import Foundation
import Rego
import SemanticKitBuildPluginsCore
import SemanticKitBuildPluginsFacts

public struct PolicyInput: Codable, Equatable, Sendable {
    public var repositoryConfiguration: RepositoryConfiguration
    public var directDependencyURLs: [String]
    public var workflowContainsScriptEntrypoints: Bool
    public var swiftSourceFacts: SwiftSourceFacts

    public init(
        repositoryConfiguration: RepositoryConfiguration,
        directDependencyURLs: [String],
        workflowContainsScriptEntrypoints: Bool,
        swiftSourceFacts: SwiftSourceFacts
    ) {
        self.repositoryConfiguration = repositoryConfiguration
        self.directDependencyURLs = directDependencyURLs
        self.workflowContainsScriptEntrypoints = workflowContainsScriptEntrypoints
        self.swiftSourceFacts = swiftSourceFacts
    }
}

public struct PolicyEvaluation: Equatable, Sendable {
    public var backendName: String
    public var diagnostics: [ValidationDiagnostic]

    public init(backendName: String, diagnostics: [ValidationDiagnostic]) {
        self.backendName = backendName
        self.diagnostics = diagnostics
    }
}

public struct SwiftOPAPolicyEngine {
    private let fileManager: FileManager

    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    public var backendName: String { "SwiftOPA" }

    public func evaluate(_ input: PolicyInput, packageDirectory: URL) async -> PolicyEvaluation {
        do {
            let policies = try discoverPolicyModules(packageDirectory: packageDirectory)
            guard !policies.isEmpty else {
                return PolicyEvaluation(backendName: backendName, diagnostics: [])
            }

            let bundleDirectory = try buildBundleDirectory(from: policies)
            defer { try? fileManager.removeItem(at: bundleDirectory.deletingLastPathComponent()) }

            let diagnostics = try await Self.evaluateBundleAsync(bundleDirectory: bundleDirectory, input: input)
            return PolicyEvaluation(backendName: backendName, diagnostics: diagnostics)
        } catch {
            return PolicyEvaluation(
                backendName: backendName,
                diagnostics: [
                    ValidationDiagnostic(
                        severity: .error,
                        message: "Policy evaluation failed: \(error)",
                        location: "Policies"
                    )
                ]
            )
        }
    }

    private func discoverPolicyModules(packageDirectory: URL) throws -> [URL] {
        var moduleFiles: [URL] = []
        for root in try policyRoots(packageDirectory: packageDirectory) {
            let enumerator = fileManager.enumerator(
                at: root,
                includingPropertiesForKeys: [.isRegularFileKey],
                options: [.skipsHiddenFiles]
            )

            while let fileURL = enumerator?.nextObject() as? URL {
                guard fileURL.pathExtension == "rego" else { continue }
                moduleFiles.append(fileURL)
            }
        }

        return moduleFiles.sorted { $0.path < $1.path }
    }

    private func policyRoots(packageDirectory: URL) throws -> [URL] {
        var roots: [URL] = []
        let localRoot = packageDirectory.appendingPathComponent("Policies", isDirectory: true)
        if fileManager.fileExists(atPath: localRoot.path) {
            roots.append(localRoot)
        }

        let checkoutsRoot = packageDirectory.appendingPathComponent(".build/checkouts", isDirectory: true)
        if fileManager.fileExists(atPath: checkoutsRoot.path) {
            let dependencyRoots = try fileManager.contentsOfDirectory(at: checkoutsRoot, includingPropertiesForKeys: nil)
                .map { $0.appendingPathComponent("Policies", isDirectory: true) }
                .filter { fileManager.fileExists(atPath: $0.path) }
            roots.append(contentsOf: dependencyRoots)
        }

        return roots
    }

    private func buildBundleDirectory(from moduleFiles: [URL]) throws -> URL {
        let tempRoot = fileManager.temporaryDirectory.appendingPathComponent(UUID().uuidString, isDirectory: true)
        let sourceDirectory = tempRoot.appendingPathComponent("bundle-source", isDirectory: true)
        let outputArchive = tempRoot.appendingPathComponent("bundle.tar.gz")
        let extractedBundle = tempRoot.appendingPathComponent("bundle", isDirectory: true)

        try fileManager.createDirectory(at: sourceDirectory, withIntermediateDirectories: true)

        for (index, moduleURL) in moduleFiles.enumerated() {
            let destination = sourceDirectory.appendingPathComponent("module-\(index).rego")
            try fileManager.copyItem(at: moduleURL, to: destination)
        }

        try runProcess(
            executable: "/Users/me/.local/bin/opa",
            arguments: ["build", "--bundle", "--target", "plan", "--entrypoint", "semantickit/main/decision", "--output", outputArchive.path, sourceDirectory.path],
            currentDirectory: tempRoot
        )

        try fileManager.createDirectory(at: extractedBundle, withIntermediateDirectories: true)
        try runProcess(
            executable: "/usr/bin/tar",
            arguments: ["-xzf", outputArchive.path, "-C", extractedBundle.path],
            currentDirectory: tempRoot
        )

        return extractedBundle
    }

    private static func evaluateBundleAsync(bundleDirectory: URL, input: PolicyInput) async throws -> [ValidationDiagnostic] {
        let bundle = try loadBundleFromDirectory(bundleDirectory)
        var engine = OPA.Engine(bundles: ["semantic-kit": bundle])

        let prepared = try await engine.prepareForEvaluation(query: "data.semantickit.main.decision")
        let inputData = try JSONEncoder().encode(input)
        let regoInput = try AST.RegoValue(jsonData: inputData)
        let resultSet = try await prepared.evaluate(input: regoInput)

        return try parseDiagnostics(from: resultSet)
    }

    private static func loadBundleFromDirectory(_ directory: URL) throws -> OPA.Bundle {
        let fileManager = FileManager.default
        let manifestURL = directory.appendingPathComponent(".manifest")
        let planURL = directory.appendingPathComponent("plan.json")
        let dataURL = directory.appendingPathComponent("data.json")

        let manifestData = try Data(contentsOf: manifestURL)
        let manifest = try OPA.Manifest(from: manifestData)

        let planFiles = [
            BundleFile(url: URL(string: "/plan.json")!, data: try Data(contentsOf: planURL))
        ]

        let regoFiles: [BundleFile]
        let policiesDirectory = directory.appendingPathComponent("Policies", isDirectory: true)
        if fileManager.fileExists(atPath: policiesDirectory.path) {
            let files = try fileManager.contentsOfDirectory(at: policiesDirectory, includingPropertiesForKeys: nil)
                .filter { $0.pathExtension == "rego" }
                .sorted { $0.path < $1.path }
            regoFiles = try files.map {
                BundleFile(url: URL(string: "/Policies/\($0.lastPathComponent)")!, data: try Data(contentsOf: $0))
            }
        } else {
            regoFiles = []
        }

        let dataValue: AST.RegoValue
        if fileManager.fileExists(atPath: dataURL.path) {
            dataValue = try AST.RegoValue(jsonData: Data(contentsOf: dataURL))
        } else {
            dataValue = .object([:])
        }

        return try OPA.Bundle(manifest: manifest, planFiles: planFiles, regoFiles: regoFiles, data: dataValue)
    }

    private static func parseDiagnostics(from resultSet: ResultSet) throws -> [ValidationDiagnostic] {
        let data = Data(try resultSet.jsonString.utf8)
        let root = try JSONSerialization.jsonObject(with: data)
        guard let decision = extractDecisionObject(from: root) else {
            return []
        }

        var rendered: [ValidationDiagnostic] = []
        rendered.append(contentsOf: parseBucket(from: decision["deny"], defaultSeverity: ValidationDiagnostic.Severity.error))
        rendered.append(contentsOf: parseBucket(from: decision["warn"], defaultSeverity: ValidationDiagnostic.Severity.warning))
        rendered.append(contentsOf: parseBucket(from: decision["note"], defaultSeverity: ValidationDiagnostic.Severity.note))
        return rendered
    }

    private static func extractDecisionObject(from root: Any) -> [String: Any]? {
        guard let array = root as? [Any], let first = array.first as? [String: Any] else {
            return nil
        }

        if first["deny"] != nil || first["warn"] != nil || first["note"] != nil {
            return first
        }

        if let result = first["result"] as? [String: Any] {
            return result
        }

        if let expressions = first["expressions"] as? [[String: Any]],
           let value = expressions.first?["value"] as? [String: Any] {
            return value
        }

        return nil
    }

    private static func parseBucket(
        from rawValue: Any?,
        defaultSeverity: ValidationDiagnostic.Severity
    ) -> [ValidationDiagnostic] {
        guard let entries = rawValue as? [Any] else {
            return []
        }

        return entries.compactMap { item in
            guard let dict = item as? [String: Any],
                  let message = dict["message"] as? String else {
                return nil
            }

            let artifact = dict["artifact"] as? String
            let line = dict["line"] as? Int
            let column = dict["column"] as? Int
            let location = formatLocation(artifact: artifact, line: line, column: column)
            let severity = (dict["severity"] as? String).flatMap(ValidationDiagnostic.Severity.init(rawValue:)) ?? defaultSeverity
            return ValidationDiagnostic(severity: severity, message: message, location: location)
        }
    }

    private static func formatLocation(artifact: String?, line: Int?, column: Int?) -> String? {
        guard let artifact else {
            return nil
        }

        switch (line, column) {
        case let (line?, column?):
            return "\(artifact):\(line):\(column)"
        case let (line?, nil):
            return "\(artifact):\(line)"
        default:
            return artifact
        }
    }

    private func runProcess(executable: String, arguments: [String], currentDirectory: URL) throws {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: executable)
        process.arguments = arguments
        process.currentDirectoryURL = currentDirectory

        let outputPipe = Pipe()
        let errorPipe = Pipe()
        process.standardOutput = outputPipe
        process.standardError = errorPipe

        try process.run()
        process.waitUntilExit()

        guard process.terminationStatus == 0 else {
            let errorOutput = String(data: errorPipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8) ?? ""
            throw NSError(
                domain: "SemanticKitBuildPluginsPolicy.Process",
                code: Int(process.terminationStatus),
                userInfo: [NSLocalizedDescriptionKey: errorOutput]
            )
        }
    }
}

