import Foundation

public struct ToolExecutionContext: Sendable {
    public var arguments: [String]
    public var packageDirectory: URL

    public init(arguments: [String], packageDirectory: URL) {
        self.arguments = arguments
        self.packageDirectory = packageDirectory
    }
}

public struct SemanticKitCommandRunner {
    private let initializer: RepositoryInitializer
    private let evaluator: BuildToolPolicyEvaluator
    private let migrationReporter: MigrationReporter

    public init(
        initializer: RepositoryInitializer = RepositoryInitializer(),
        evaluator: BuildToolPolicyEvaluator = BuildToolPolicyEvaluator(),
        migrationReporter: MigrationReporter = MigrationReporter()
    ) {
        self.initializer = initializer
        self.evaluator = evaluator
        self.migrationReporter = migrationReporter
    }

    public func run(context: ToolExecutionContext) async -> CommandResult {
        do {
            let options = ParsedOptions(arguments: context.arguments)
            switch options.command {
            case .initialize:
                return try initializer.initialize(
                    packageDirectory: context.packageDirectory,
                    mode: options.writeMode,
                    includeReleaseWorkflow: options.includeReleaseWorkflow
                )
            case .validate:
                return await evaluator.evaluate(
                    packageDirectory: context.packageDirectory,
                    policyModuleRoots: options.policyModuleRoots
                )
            case .migrateScripts:
                return migrationReporter.report()
            case .buildTool:
                return try await runBuildToolValidation(
                    context: context,
                    outputDirectory: options.outputDirectory,
                    policyBundleArchive: options.policyBundleArchive,
                    policyModuleRoots: options.policyModuleRoots
                )
            case .help:
                return CommandResult(exitCode: 0, messages: [Self.helpText])
            }
        } catch {
            return CommandResult(exitCode: 2, messages: ["SemanticKitBuildPlugins error: \(error)"])
        }
    }

    private func runBuildToolValidation(
        context: ToolExecutionContext,
        outputDirectory: URL?,
        policyBundleArchive: URL?,
        policyModuleRoots: [URL]
    ) async throws -> CommandResult {
        let result = await evaluator.evaluate(
            packageDirectory: context.packageDirectory,
            policyBundleArchive: policyBundleArchive,
            policyModuleRoots: policyModuleRoots
        )
        guard let outputDirectory else {
            return result
        }

        try FileManager.default.createDirectory(at: outputDirectory, withIntermediateDirectories: true)
        let reportURL = outputDirectory.appendingPathComponent("semantic-kit-build-tool-validation.txt")
        let body = (result.messages + result.diagnostics.map { diagnostic in
            let location = diagnostic.location.map { " [\($0)]" } ?? ""
            return "\(diagnostic.severity.rawValue): \(diagnostic.message)\(location)"
        }).joined(separator: "\n") + "\n"
        try body.write(to: reportURL, atomically: true, encoding: .utf8)
        return result
    }

    public static let helpText = """
    Usage: swift package semantic-kit-build-plugins <command> [options]

    Commands:
      init              Generate SemanticKit CI/CD workflow and repository config.
      validate          Validate generated CI/CD workflow and repository config.
      migrate-scripts   Report script migration profiles and status.
      build-tool        Internal build-tool plugin validation entrypoint.

    Options:
      --write                Write generated files. Without this flag, init is dry-run.
      --dry-run              Preview generated files.
      --include-release      Include release workflow generation.
      --output-directory DIR Build-tool validation output directory.
      --policy-bundle FILE   Prebuilt OPA bundle archive produced by the build-tool plugin.
      --policy-root DIR      Policy module root included in the prebuilt OPA bundle.
    """
}

private struct ParsedOptions {
    enum Command {
        case initialize
        case validate
        case migrateScripts
        case buildTool
        case help
    }

    var command: Command
    var writeMode: WriteMode
    var includeReleaseWorkflow: Bool
    var outputDirectory: URL?
    var policyBundleArchive: URL?
    var policyModuleRoots: [URL]

    init(arguments: [String]) {
        command = .help
        writeMode = .dryRun
        includeReleaseWorkflow = false
        outputDirectory = nil
        policyBundleArchive = nil
        policyModuleRoots = []

        var index = 0
        while index < arguments.count {
            let argument = arguments[index]
            switch argument {
            case "init":
                command = .initialize
            case "validate":
                command = .validate
            case "migrate-scripts":
                command = .migrateScripts
            case "build-tool":
                command = .buildTool
            case "--write":
                writeMode = .write
            case "--dry-run":
                writeMode = .dryRun
            case "--include-release":
                includeReleaseWorkflow = true
            case "--output-directory":
                if arguments.indices.contains(index + 1) {
                    outputDirectory = URL(fileURLWithPath: arguments[index + 1])
                    index += 1
                }
            case "--policy-bundle":
                if arguments.indices.contains(index + 1) {
                    policyBundleArchive = URL(fileURLWithPath: arguments[index + 1])
                    index += 1
                }
            case "--policy-root":
                if arguments.indices.contains(index + 1) {
                    policyModuleRoots.append(URL(fileURLWithPath: arguments[index + 1], isDirectory: true))
                    index += 1
                }
            case "--help", "-h":
                command = .help
            default:
                break
            }
            index += 1
        }
    }
}
