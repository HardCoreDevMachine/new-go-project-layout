GO_FILES := $(shell find . -type f -name '*.go' -not -path './vendor/*')
PACKAGES := $(shell go list ./... 2>/dev/null)

.PHONY: verify fmt-check vet test build

verify: fmt-check vet test

fmt-check:
	@if [ -n "$(GO_FILES)" ]; then \
		unformatted="$$(gofmt -l $(GO_FILES))"; \
		test -z "$$unformatted" || { echo "Run gofmt on:"; echo "$$unformatted"; exit 1; }; \
	fi

vet:
	@if [ -n "$(PACKAGES)" ]; then go vet $(PACKAGES); fi

test:
	@if [ -n "$(PACKAGES)" ]; then go test $(PACKAGES); fi

build:
	@if [ -n "$(PACKAGES)" ]; then go build $(PACKAGES); fi
