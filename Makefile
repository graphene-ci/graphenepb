.DEFAULT_GOAL := help
BIN := $(CURDIR)/bin

.PHONY: configure
configure: ## Set up a working environment from scratch (tools go to bin/)
	GOBIN=$(BIN) go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.36.11
	GOBIN=$(BIN) go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.5.1
	GOBIN=$(BIN) go install github.com/easyp-tech/easyp/cmd/easyp@latest
	go mod tidy

.PHONY: generate
generate: ## Generate Go code from proto (easyp -> v1/*.pb.go)
	PATH=$(BIN):$$PATH easyp generate
	go build ./...

.PHONY: lint
lint: ## Lint proto files
	PATH=$(BIN):$$PATH easyp lint

.PHONY: breaking
breaking: ## Check wire compatibility against main
	PATH=$(BIN):$$PATH easyp breaking

.PHONY: help
help: ## List all targets with explanations
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-12s\033[0m %s\n", $$1, $$2}'
