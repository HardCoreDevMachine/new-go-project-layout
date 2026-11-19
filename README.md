# Standard Go Project Layout

Translations:

* [Русский](README_ru.md)

The English README is the canonical document. Keep the Russian translation aligned with it when changing the template.

## Purpose

This repository is a directory-layout template for Go projects. It intentionally keeps the documented directories and leaf placeholders so a project created from the template has a stable starting tree. It is not an official Go standard and does not prescribe an architecture, framework, transport, datastore, or deployment platform.

## Starting a project

1. Create a repository from this template.
2. Replace the placeholder module path before adding packages:

   ```sh
   go mod edit -module=example.com/your/project
   ```

   Use the repository location when the module will be published, for example `github.com/acme/project`.
3. Put every executable in `cmd/<name>/`; put the implementation in the documented directories that fit its responsibility.
4. After adding imports or removing dependencies, run `go mod tidy` and commit both `go.mod` and `go.sum`.
5. Run `make verify`. It checks formatting, `go vet`, and tests for every Go package present in the repository. The empty template succeeds without packages.

`go.mod` declares Go 1.27.0, the minimum toolchain for projects created from this version of the template. Review that version when adopting a new Go release; Go supports only its two most recent major releases.

## Directories

| Directory | Reserved purpose |
|---|---|
| [`cmd/`](cmd/README.md) | Entry points for executable programs; each subdirectory names its binary. |
| [`internal/`](internal/README.md) | Packages protected by Go's `internal` import rule. |
| [`pkg/`](pkg/README.md) | Stable packages deliberately supported for imports outside this module. |
| [`api/`](api/README.md) | API contracts: OpenAPI, protobuf, JSON Schema, and similar definitions. |
| [`web/`](web/README.md) | Web assets, server templates, and single-page applications. |
| [`configs/`](configs/README.md) | Configuration templates and defaults; never commit credentials. |
| [`init/`](init/README.md) | Service-manager and process-supervisor configuration. |
| [`scripts/`](scripts/README.md) | Repository maintenance, build, install, and analysis scripts. |
| [`build/`](build/README.md) | Packaging assets and build support files. |
| [`deployments/`](deployments/README.md) | Deployment manifests and infrastructure configuration. |
| [`test/`](test/README.md) | Black-box test applications, fixtures, and test data. |
| [`docs/`](docs/README.md) | Design and user documentation beyond package documentation. |
| [`tools/`](tools/README.md) | Development and repository-support tools. |
| [`examples/`](examples/README.md) | Runnable examples of applications or public packages. |
| [`third_party/`](third_party/README.md) | Checked-in third-party helpers or maintained forks, with their licenses. |
| [`githooks/`](githooks/README.md) | Versioned Git hooks and hook-installation support. |
| [`assets/`](assets/README.md) | Repository assets such as images, logos, and release media. |
| [`website/`](website/README.md) | Source for a project website when it does not live elsewhere. |
| [`vendor/`](vendor/README.md) | Generated dependency tree when an explicit vendoring policy requires it. |

## Module and dependency policy

Use Go modules. The `module` directive is the import-path prefix, so it must be changed from `example.com/project` before project code is published. Let Go commands manage dependencies: use `go get` to add or change a dependency and `go mod tidy` to synchronize module metadata.

`vendor/` stays in the template to reserve its purpose, but the template does not vendor dependencies. Create it only when the project has a documented offline, reproducibility, or policy requirement:

```sh
go mod vendor
```

Do not hand-edit generated vendor content. Libraries normally should not commit vendored dependencies.

## Quality checks

The root `Makefile` uses only the Go toolchain:

```sh
make fmt-check
make vet
make test
make build
make verify
```

`make verify` is the local quality check. Projects can add a maintained external linter only after choosing its rules and version deliberately; this layout does not select one for every consumer.

## References

* [Organizing a Go module](https://go.dev/doc/modules/layout)
* [Managing dependencies](https://go.dev/doc/modules/managing-dependencies)
* [`go.mod` file reference](https://go.dev/doc/modules/gomod-ref)
* [Go Code Review Comments](https://go.dev/wiki/CodeReviewComments)

Go modules do not require a repository-level `src/` directory or a project inside `GOPATH`.
