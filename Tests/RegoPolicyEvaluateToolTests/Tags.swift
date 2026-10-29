import Testing

extension Tag {
    /// The node shape the evaluator gives policies as `input`.
    @Tag static var syntaxInput: Self
    /// Planning, loading and evaluating policies.
    @Tag static var evaluation: Self
    /// Decoding decisions and printing findings.
    @Tag static var diagnostics: Self
    /// The SemanticKit invariants as build rules.
    @Tag static var invariants: Self
    /// Tests that run the `opa` CLI.
    @Tag static var opa: Self
}
