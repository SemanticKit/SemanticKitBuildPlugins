import Foundation
import SwiftParser
import SwiftSyntax

public struct SwiftBindingFact: Codable, Equatable, Sendable {
    public var artifact: String
    public var line: Int
    public var column: Int
    public var kind: String

    public init(artifact: String, line: Int, column: Int, kind: String) {
        self.artifact = artifact
        self.line = line
        self.column = column
        self.kind = kind
    }
}

public struct SwiftSourceFacts: Codable, Equatable, Sendable {
    public var bindingConstructionFacts: [SwiftBindingFact]

    public init(bindingConstructionFacts: [SwiftBindingFact] = []) {
        self.bindingConstructionFacts = bindingConstructionFacts
    }
}

public struct ArtifactCatalog: Codable, Equatable, Sendable {
    public var regoModules: [String]
    public var swiftSources: [String]
    public var packageManifest: [String]
    public var workflowYAML: [String]
    public var policyModuleRoots: [String]

    public init(
        regoModules: [String] = [],
        swiftSources: [String] = [],
        packageManifest: [String] = [],
        workflowYAML: [String] = [],
        policyModuleRoots: [String] = []
    ) {
        self.regoModules = regoModules
        self.swiftSources = swiftSources
        self.packageManifest = packageManifest
        self.workflowYAML = workflowYAML
        self.policyModuleRoots = policyModuleRoots
    }
}

public struct SwiftSourceFactCollector {
    private let fileManager: FileManager

    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    public func collectArtifactCatalog(packageDirectory: URL, policyModuleRoots: [URL]) throws -> ArtifactCatalog {
        let regoModules = discoverRegoModules(policyModuleRoots: policyModuleRoots, packageDirectory: packageDirectory)
        let swiftSources = discoverSwiftSources(packageDirectory: packageDirectory)
        let packageManifest: [String] = {
            let manifest = packageDirectory.appendingPathComponent("Package.swift")
            guard fileManager.fileExists(atPath: manifest.path) else { return [] }
            return ["Package.swift"]
        }()
        let workflowYAML = discoverWorkflowYAML(packageDirectory: packageDirectory)
        return ArtifactCatalog(
            regoModules: regoModules,
            swiftSources: swiftSources,
            packageManifest: packageManifest,
            workflowYAML: workflowYAML,
            policyModuleRoots: policyModuleRoots.map { $0.path }.sorted()
        )
    }

    public func collect(packageDirectory: URL) throws -> SwiftSourceFacts {
        let sourcesRoot = packageDirectory.appendingPathComponent("Sources", isDirectory: true)
        guard fileManager.fileExists(atPath: sourcesRoot.path) else {
            return SwiftSourceFacts()
        }

        var facts: [SwiftBindingFact] = []
        let enumerator = fileManager.enumerator(at: sourcesRoot, includingPropertiesForKeys: [.isRegularFileKey])
        while let fileURL = enumerator?.nextObject() as? URL {
            guard fileURL.pathExtension == "swift" else { continue }
            let source = try String(contentsOf: fileURL, encoding: .utf8)
            let tree = Parser.parse(source: source)
            let converter = SourceLocationConverter(fileName: fileURL.path, tree: tree)
            let artifact = relativeArtifactPath(fileURL: fileURL, packageDirectory: packageDirectory)
            let visitor = BindingVisitor(converter: converter, artifact: artifact)
            facts.append(contentsOf: visitor.collect(from: tree))
        }
        return SwiftSourceFacts(bindingConstructionFacts: facts.sorted { ($0.artifact, $0.line, $0.column) < ($1.artifact, $1.line, $1.column) })
    }

    private func relativeArtifactPath(fileURL: URL, packageDirectory: URL) -> String {
        let packagePath = packageDirectory.standardizedFileURL.path
        let filePath = fileURL.standardizedFileURL.path
        if filePath.hasPrefix(packagePath + "/") {
            return String(filePath.dropFirst(packagePath.count + 1))
        }
        return fileURL.lastPathComponent
    }

    private func discoverRegoModules(policyModuleRoots: [URL], packageDirectory: URL) -> [String] {
        var files: [String] = []
        for root in policyModuleRoots {
            let enumerator = fileManager.enumerator(at: root, includingPropertiesForKeys: [.isRegularFileKey])
            while let fileURL = enumerator?.nextObject() as? URL {
                guard fileURL.pathExtension == "rego" else { continue }
                files.append(relativeArtifactPath(fileURL: fileURL, packageDirectory: packageDirectory))
            }
        }
        return files.sorted()
    }

    private func discoverSwiftSources(packageDirectory: URL) -> [String] {
        let sourcesRoot = packageDirectory.appendingPathComponent("Sources", isDirectory: true)
        guard fileManager.fileExists(atPath: sourcesRoot.path) else { return [] }

        var files: [String] = []
        let enumerator = fileManager.enumerator(at: sourcesRoot, includingPropertiesForKeys: [.isRegularFileKey])
        while let fileURL = enumerator?.nextObject() as? URL {
            guard fileURL.pathExtension == "swift" else { continue }
            files.append(relativeArtifactPath(fileURL: fileURL, packageDirectory: packageDirectory))
        }
        return files.sorted()
    }

    private func discoverWorkflowYAML(packageDirectory: URL) -> [String] {
        let workflowsRoot = packageDirectory.appendingPathComponent(".github/workflows", isDirectory: true)
        guard fileManager.fileExists(atPath: workflowsRoot.path) else { return [] }

        var files: [String] = []
        let enumerator = fileManager.enumerator(at: workflowsRoot, includingPropertiesForKeys: [.isRegularFileKey])
        while let fileURL = enumerator?.nextObject() as? URL {
            let ext = fileURL.pathExtension.lowercased()
            guard ext == "yml" || ext == "yaml" else { continue }
            files.append(relativeArtifactPath(fileURL: fileURL, packageDirectory: packageDirectory))
        }
        return files.sorted()
    }
}

private final class BindingVisitor: SyntaxVisitor {
    private let converter: SourceLocationConverter
    private let artifact: String
    private(set) var facts: [SwiftBindingFact] = []

    init(converter: SourceLocationConverter, artifact: String) {
        self.converter = converter
        self.artifact = artifact
        super.init(viewMode: .sourceAccurate)
    }

    func collect(from tree: some SyntaxProtocol) -> [SwiftBindingFact] {
        walk(Syntax(tree))
        return facts
    }

    override func visit(_ node: FunctionCallExprSyntax) -> SyntaxVisitorContinueKind {
        let called = node.calledExpression.trimmedDescription.replacingOccurrences(of: " ", with: "")
        guard called == "Binding" || called == "Binding.init" else {
            return .visitChildren
        }

        let labels = Set(node.arguments.compactMap { $0.label?.text })
        guard labels.contains("get") && labels.contains("set") else {
            return .visitChildren
        }

        let location = converter.location(for: node.positionAfterSkippingLeadingTrivia)
        facts.append(
            SwiftBindingFact(
                artifact: artifact,
                line: location.line,
                column: location.column,
                kind: "binding_get_set_initializer"
            )
        )

        return .visitChildren
    }
}
