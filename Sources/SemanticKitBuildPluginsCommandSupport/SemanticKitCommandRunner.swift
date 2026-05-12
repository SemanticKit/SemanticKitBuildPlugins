import Foundation

public struct ToolExecutionContext: Sendable {
    public var arguments: [String]
    public var packageDirectory: URL

    public init(arguments: [String], packageDirectory: URL) {
        self.arguments = arguments
        self.packageDirectory = packageDirectory
    }
}

public struct SemanticKitCommandRunner: Sendable {
    private let initializer: RepositoryInitializer
    private let validator: RepositoryValidator
    private let migrationReporter: MigrationReporter

    public init(
        initializer: RepositoryInitializer = RepositoryInitializer(),
        validator: RepositoryValidator = RepositoryValidator(),
        migrationReporter: MigrationReporter = MigrationReporter()
    ) {
        self.initializer = initializer
        self.validator = validator
        self.migrationReporter = migrationReporter
    }

    public func run(context: ToolExecutionContext) -> CommandResult {
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
                return validator.validate(packageDirectory: context.packageDirectory)
            case .migrateScripts:
                return migrationReporter.report()
            case .buildTool:
                return try runBuildToolValidation(context: context, outputDirectory: options.outputDirectory)
            case .help:
                return CommandResult(exitCode: 0, messages: [Self.helpText])
            }
        } catch {
            return CommandResult(exitCode: 2, messages: ["SemanticKitBuildPlugins error: \(error)"])
        }
    }

    private func runBuildToolValidation(context: ToolExecutionContext, outputDirectory: URL?) throws -> CommandResult {
        let result = validator.validate(packageDirectory: context.packageDirectory)
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

    init(arguments: [String]) {
        command = .help
        writeMode = .dryRun
        includeReleaseWorkflow = false
        outputDirectory = nil

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
            case "--help", "-h":
                command = .help
            default:
                break
            }
            index += 1
        }
    }
}
