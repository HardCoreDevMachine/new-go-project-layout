# `/internal`

Packages that must not be imported from outside the parent directory tree. Go enforces this restriction at compile time.

Use nested `internal` directories when a narrower import boundary is required. The `app/` and `pkg/` placeholders are available for application-specific and shared internal packages; adapt their contents to the project rather than treating them as required layers.

See [internal directories](https://pkg.go.dev/cmd/go#hdr-Internal_Directories) in the `go` command reference.
