# `/pkg`

Packages in this directory are intended to be imported by code outside this module. Treat their APIs as supported contracts: document them, test compatibility deliberately, and version breaking changes appropriately.

`pkg/` is not a substitute for private application code. Use `internal/` for packages whose callers must remain inside this repository.
