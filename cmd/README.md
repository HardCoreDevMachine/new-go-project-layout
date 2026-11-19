# `/cmd`

Entry points for executable programs. Create one subdirectory per binary; its name is the executable name, for example `cmd/api-server/`.

Keep `main` focused on process setup and dependency wiring. Put reusable application behavior in the appropriate package rather than accumulating it in the command package.

See [Organizing a Go module](https://go.dev/doc/modules/layout) for the Go command layout convention.
