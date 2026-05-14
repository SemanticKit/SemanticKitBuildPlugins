import Foundation

struct ToolInvocation {
    var packageDirectory: URL
    var sourceFile: URL?
    var policyBundleArchive: URL?

    init(commandLineArguments: [String]) {
        var packageDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        var sourceFile: URL?
        var policyBundleArchive: URL?
        var index = 0

        while index < commandLineArguments.count {
            let argument = commandLineArguments[index]
            switch argument {
            case "--package-directory" where commandLineArguments.indices.contains(index + 1):
                packageDirectory = URL(fileURLWithPath: commandLineArguments[index + 1])
                index += 2
                continue
            case "--swift-source" where commandLineArguments.indices.contains(index + 1):
                sourceFile = URL(fileURLWithPath: commandLineArguments[index + 1])
                index += 2
                continue
            case "--policy-bundle" where commandLineArguments.indices.contains(index + 1):
                policyBundleArchive = URL(fileURLWithPath: commandLineArguments[index + 1])
                index += 2
                continue
            default:
                index += 1
            }
        }

        self.packageDirectory = packageDirectory
        self.sourceFile = sourceFile
        self.policyBundleArchive = policyBundleArchive
    }
}
