import Foundation

public struct GitHubWorkflow: Codable, Equatable, Sendable {
    public var name: String
    public var triggers: WorkflowTriggers
    public var permissions: WorkflowPermissions
    public var jobs: WorkflowJobs

    public init(
        name: String,
        triggers: WorkflowTriggers = .defaultCI,
        permissions: WorkflowPermissions = .readOnly,
        jobs: WorkflowJobs = .semanticKitDefault
    ) {
        self.name = name
        self.triggers = triggers
        self.permissions = permissions
        self.jobs = jobs
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case triggers = "on"
        case permissions
        case jobs
    }
}

public struct WorkflowTriggers: Codable, Equatable, Sendable {
    public var pullRequest: WorkflowPullRequestTrigger
    public var push: WorkflowPushTrigger

    public init(
        pullRequest: WorkflowPullRequestTrigger = WorkflowPullRequestTrigger(),
        push: WorkflowPushTrigger = WorkflowPushTrigger()
    ) {
        self.pullRequest = pullRequest
        self.push = push
    }

    public static let defaultCI = WorkflowTriggers()

    private enum CodingKeys: String, CodingKey {
        case pullRequest = "pull_request"
        case push
    }
}

public struct WorkflowPullRequestTrigger: Codable, Equatable, Sendable {
    public init() {}
}

public struct WorkflowPushTrigger: Codable, Equatable, Sendable {
    public var branches: [String]

    public init(branches: [String] = ["main"] ) {
        self.branches = branches
    }
}

public struct WorkflowPermissions: Codable, Equatable, Sendable {
    public var contents: String

    public init(contents: String) {
        self.contents = contents
    }

    public static let readOnly = WorkflowPermissions(contents: "read")
}

public struct WorkflowJobs: Codable, Equatable, Sendable {
    public var validate: WorkflowJob

    public init(validate: WorkflowJob) {
        self.validate = validate
    }

    public static let semanticKitDefault = WorkflowJobs(
        validate: WorkflowJob(
            name: "Validate",
            runsOn: "macos-26",
            steps: [
                WorkflowStep(name: "Check out sources", uses: "actions/checkout@v4"),
                WorkflowStep(name: "Resolve dependencies", run: "swift package resolve"),
                WorkflowStep(name: "Build", run: "swift build"),
                WorkflowStep(name: "Test", run: "swift test"),
                WorkflowStep(name: "Validate SemanticKit CI contract", run: "swift package --allow-writing-to-package-directory semantic-kit-build-plugins validate"),
            ]
        )
    )
}

public struct WorkflowJob: Codable, Equatable, Sendable {
    public var name: String
    public var runsOn: String
    public var steps: [WorkflowStep]

    public init(name: String, runsOn: String, steps: [WorkflowStep]) {
        self.name = name
        self.runsOn = runsOn
        self.steps = steps
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case runsOn = "runs-on"
        case steps
    }
}

public struct WorkflowStep: Codable, Equatable, Sendable {
    public var name: String
    public var uses: String?
    public var run: String?

    public init(name: String, uses: String? = nil, run: String? = nil) {
        self.name = name
        self.uses = uses
        self.run = run
    }
}
