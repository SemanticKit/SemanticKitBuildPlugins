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

public struct SwiftSafeAreaOptOutFact: Codable, Equatable, Sendable {
    public var artifact: String
    public var line: Int
    public var column: Int
    public var kind: String
    public var apiName: String
    public var memberName: String
    public var argumentLabels: [String]

    public init(
        artifact: String,
        line: Int,
        column: Int,
        kind: String,
        apiName: String,
        memberName: String,
        argumentLabels: [String]
    ) {
        self.artifact = artifact
        self.line = line
        self.column = column
        self.kind = kind
        self.apiName = apiName
        self.memberName = memberName
        self.argumentLabels = argumentLabels
    }
}

public struct SwiftSourceFacts: Codable, Equatable, Sendable {
    public var bindingConstructionFacts: [SwiftBindingFact]
    public var safeAreaOptOutFacts: [SwiftSafeAreaOptOutFact]

    public init(
        bindingConstructionFacts: [SwiftBindingFact] = [],
        safeAreaOptOutFacts: [SwiftSafeAreaOptOutFact] = []
    ) {
        self.bindingConstructionFacts = bindingConstructionFacts
        self.safeAreaOptOutFacts = safeAreaOptOutFacts
    }
}

public struct ArtifactCatalog: Codable, Equatable, Sendable {
    public var regoModules: [String]
    public var swiftSources: [String]
    public var packageManifest: [String]
    public var workflowYAML: [String]
    public var markdownFiles: [String]
    public var doccCatalogs: [String]
    public var propertyLists: [String]
    public var metalSources: [String]
    public var cFamilySources: [String]
    public var policyModuleRoots: [String]

    public init(
        regoModules: [String] = [],
        swiftSources: [String] = [],
        packageManifest: [String] = [],
        workflowYAML: [String] = [],
        markdownFiles: [String] = [],
        doccCatalogs: [String] = [],
        propertyLists: [String] = [],
        metalSources: [String] = [],
        cFamilySources: [String] = [],
        policyModuleRoots: [String] = []
    ) {
        self.regoModules = regoModules
        self.swiftSources = swiftSources
        self.packageManifest = packageManifest
        self.workflowYAML = workflowYAML
        self.markdownFiles = markdownFiles
        self.doccCatalogs = doccCatalogs
        self.propertyLists = propertyLists
        self.metalSources = metalSources
        self.cFamilySources = cFamilySources
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
        let markdownFiles = discoverMarkdownFiles(packageDirectory: packageDirectory)
        let doccCatalogs = discoverDoccCatalogs(packageDirectory: packageDirectory)
        let propertyLists = discoverPropertyLists(packageDirectory: packageDirectory)
        let metalSources = discoverMetalSources(packageDirectory: packageDirectory)
        let cFamilySources = discoverCFamilySources(packageDirectory: packageDirectory)
        return ArtifactCatalog(
            regoModules: regoModules,
            swiftSources: swiftSources,
            packageManifest: packageManifest,
            workflowYAML: workflowYAML,
            markdownFiles: markdownFiles,
            doccCatalogs: doccCatalogs,
            propertyLists: propertyLists,
            metalSources: metalSources,
            cFamilySources: cFamilySources,
            policyModuleRoots: policyModuleRoots.map { $0.path }.sorted()
        )
    }

    public func collect(packageDirectory: URL) throws -> SwiftSourceFacts {
        let sourcesRoot = packageDirectory.appendingPathComponent("Sources", isDirectory: true)
        guard fileManager.fileExists(atPath: sourcesRoot.path) else {
            return SwiftSourceFacts()
        }

        var bindingFacts: [SwiftBindingFact] = []
        var safeAreaOptOutFacts: [SwiftSafeAreaOptOutFact] = []
        let enumerator = fileManager.enumerator(at: sourcesRoot, includingPropertiesForKeys: [.isRegularFileKey])
        while let fileURL = enumerator?.nextObject() as? URL {
            guard fileURL.pathExtension == "swift" else { continue }
            let source = try String(contentsOf: fileURL, encoding: .utf8)
            let tree = Parser.parse(source: source)
            let converter = SourceLocationConverter(fileName: fileURL.path, tree: tree)
            let artifact = relativeArtifactPath(fileURL: fileURL, packageDirectory: packageDirectory)
            let visitor = SwiftSourceFactVisitor(converter: converter, artifact: artifact)
            let fileFacts = visitor.collect(from: tree)
            bindingFacts.append(contentsOf: fileFacts.bindingConstructionFacts)
            safeAreaOptOutFacts.append(contentsOf: fileFacts.safeAreaOptOutFacts)
        }
        return SwiftSourceFacts(
            bindingConstructionFacts: bindingFacts.sorted { ($0.artifact, $0.line, $0.column) < ($1.artifact, $1.line, $1.column) },
            safeAreaOptOutFacts: safeAreaOptOutFacts.sorted { ($0.artifact, $0.line, $0.column) < ($1.artifact, $1.line, $1.column) }
        )
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

    private func discoverMarkdownFiles(packageDirectory: URL) -> [String] {
        var files: [String] = []
        let enumerator = fileManager.enumerator(at: packageDirectory, includingPropertiesForKeys: [.isRegularFileKey, .isDirectoryKey])
        while let fileURL = enumerator?.nextObject() as? URL {
            let path = fileURL.path
            if path.contains("/.build/") || path.contains("/.swiftpm/") || path.contains("/.git/") {
                continue
            }
            guard fileURL.pathExtension.lowercased() == "md" else { continue }
            files.append(relativeArtifactPath(fileURL: fileURL, packageDirectory: packageDirectory))
        }
        return files.sorted()
    }

    private func discoverDoccCatalogs(packageDirectory: URL) -> [String] {
        var catalogs: [String] = []
        let enumerator = fileManager.enumerator(at: packageDirectory, includingPropertiesForKeys: [.isDirectoryKey])
        while let fileURL = enumerator?.nextObject() as? URL {
            let path = fileURL.path
            if path.contains("/.build/") || path.contains("/.swiftpm/") || path.contains("/.git/") {
                continue
            }
            guard fileURL.pathExtension.lowercased() == "docc" else { continue }
            catalogs.append(relativeArtifactPath(fileURL: fileURL, packageDirectory: packageDirectory))
        }
        return catalogs.sorted()
    }

    private func discoverPropertyLists(packageDirectory: URL) -> [String] {
        discoverFiles(packageDirectory: packageDirectory, allowedExtensions: ["plist"])
    }

    private func discoverMetalSources(packageDirectory: URL) -> [String] {
        discoverFiles(packageDirectory: packageDirectory, allowedExtensions: ["metal"])
    }

    private func discoverCFamilySources(packageDirectory: URL) -> [String] {
        discoverFiles(packageDirectory: packageDirectory, allowedExtensions: ["c", "cc", "cpp", "h", "hpp"])
    }

    private func discoverFiles(packageDirectory: URL, allowedExtensions: Set<String>) -> [String] {
        var files: [String] = []
        let enumerator = fileManager.enumerator(at: packageDirectory, includingPropertiesForKeys: [.isRegularFileKey])
        while let fileURL = enumerator?.nextObject() as? URL {
            let path = fileURL.path
            if path.contains("/.build/") || path.contains("/.swiftpm/") || path.contains("/.git/") {
                continue
            }
            guard allowedExtensions.contains(fileURL.pathExtension.lowercased()) else { continue }
            files.append(relativeArtifactPath(fileURL: fileURL, packageDirectory: packageDirectory))
        }
        return files.sorted()
    }
}

private final class SwiftSourceFactVisitor: SyntaxVisitor {
    private let converter: SourceLocationConverter
    private let artifact: String
    private var bindingFacts: [SwiftBindingFact] = []
    private var safeAreaOptOutFacts: [SwiftSafeAreaOptOutFact] = []

    init(converter: SourceLocationConverter, artifact: String) {
        self.converter = converter
        self.artifact = artifact
        super.init(viewMode: .sourceAccurate)
    }

    func collect(from tree: some SyntaxProtocol) -> SwiftSourceFacts {
        walk(Syntax(tree))
        return SwiftSourceFacts(
            bindingConstructionFacts: bindingFacts,
            safeAreaOptOutFacts: safeAreaOptOutFacts
        )
    }

    override func visit(_ node: FunctionCallExprSyntax) -> SyntaxVisitorContinueKind {
        collectSafeAreaOptOutFact(from: node)

        let called = node.calledExpression.trimmedDescription.replacingOccurrences(of: " ", with: "")
        guard called == "Binding" || called == "Binding.init" else {
            return .visitChildren
        }

        let labels = Set(node.arguments.compactMap { $0.label?.text })
        guard labels.contains("get") && labels.contains("set") else {
            return .visitChildren
        }

        let location = converter.location(for: node.positionAfterSkippingLeadingTrivia)
        bindingFacts.append(
            SwiftBindingFact(
                artifact: artifact,
                line: location.line,
                column: location.column,
                kind: "binding_get_set_initializer"
            )
        )

        return .visitChildren
    }

    private func collectSafeAreaOptOutFact(from node: FunctionCallExprSyntax) {
        guard let memberAccess = node.calledExpression.as(MemberAccessExprSyntax.self) else {
            return
        }

        let memberName = memberAccess.declName.baseName.text
        let kind: String
        switch memberName {
        case "ignoresSafeArea":
            kind = "swiftui_ignores_safe_area"
        case "edgesIgnoringSafeArea":
            kind = "swiftui_edges_ignoring_safe_area"
        default:
            return
        }

        let location = converter.location(for: memberAccess.declName.baseName.positionAfterSkippingLeadingTrivia)
        safeAreaOptOutFacts.append(
            SwiftSafeAreaOptOutFact(
                artifact: artifact,
                line: location.line,
                column: location.column,
                kind: kind,
                apiName: ".\(memberName)",
                memberName: memberName,
                argumentLabels: node.arguments.map { $0.label?.text ?? "_" }
            )
        )
    }
}
