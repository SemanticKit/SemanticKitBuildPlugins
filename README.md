# SemanticKitBuildPlugins

SwiftPM-native CI/CD build tooling for the SemanticKit workspace.

## Commands

After adding the package plugin to a SwiftPM repository, run:

```console
swift package --allow-writing-to-package-directory semantic-kit-build-plugins init --dry-run
swift package --allow-writing-to-package-directory semantic-kit-build-plugins init --write
swift package --allow-writing-to-package-directory semantic-kit-build-plugins validate
swift package --allow-writing-to-package-directory semantic-kit-build-plugins migrate-scripts
```

The command and build-tool plugins delegate to an internal executable target so plugin entrypoints stay thin while business logic remains in Swift modules.
