import Foundation
import SemanticKitBuildPluginsCore
import Yams

public struct RepositoryInitializer: Sendable {
    public init() {}

    public func generatedFiles(includeReleaseWorkflow: Bool = false) throws -> [GeneratedFile] {
        var files = [
            GeneratedFile(
                relativePath: ".semantic-kit/ci.yml",
                contents: try generatedYAML(for: RepositoryConfiguration())
            ),
            GeneratedFile(
                relativePath: ".github/workflows/ci.yml",
                contents: try generatedYAML(for: GitHubWorkflow(name: "SemanticKit CI"))
            ),
        ]

        if includeReleaseWorkflow {
            files.append(
                GeneratedFile(
                    relativePath: ".github/workflows/release.yml",
                    contents: try generatedYAML(for: releaseWorkflow())
                )
            )
        }

        return files
    }

    public func initialize(packageDirectory: URL, mode: WriteMode, includeReleaseWorkflow: Bool = false) throws -> CommandResult {
        let files = try generatedFiles(includeReleaseWorkflow: includeReleaseWorkflow)

        guard mode == .write else {
            return CommandResult(
                exitCode: 0,
                messages: files.map { "DRY-RUN would write \($0.relativePath)" }
            )
        }

        for file in files {
            let destination = packageDirectory.appendingPathComponent(file.relativePath)
            try FileManager.default.createDirectory(
                at: destination.deletingLastPathComponent(),
                withIntermediateDirectories: true
            )
            try file.contents.write(to: destination, atomically: true, encoding: .utf8)
        }

        return CommandResult(
            exitCode: 0,
            messages: files.map { "Wrote \($0.relativePath)" }
        )
    }

    private func generatedYAML<T: Encodable>(for value: T) throws -> String {
        try ToolingBaseline.generatedFileHeader + "\n" + YAMLEncoder().encode(value)
    }

    private func releaseWorkflow() -> GitHubWorkflow {
        GitHubWorkflow(
            name: "SemanticKit Release",
            triggers: WorkflowTriggers(push: WorkflowPushTrigger(branches: [])),
            jobs: WorkflowJobs(
                validate: WorkflowJob(
                    name: "Validate release",
                    runsOn: "macos-26",
                    steps: [
                        WorkflowStep(name: "Check out sources", uses: "actions/checkout@v4"),
                        WorkflowStep(name: "Validate SemanticKit CI contract", run: "swift package --allow-writing-to-package-directory semantic-kit-build-plugins validate"),
                    ]
                )
            )
        )
    }
}
