.PHONY: all
all: help

default: help

.PHONY: help
help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: gen-rpc
gen-rpc: ## gen rpc code of {svc}. example: make gen-rpc svc=user
	@cd app/${svc}/rpc && goctl rpc protoc ./${svc}.proto --go_out=. --go-grpc_out=. --zrpc_out=. --module github.com/XJTU-zxc/easy-chat/app/${svc}/rpc

.PHONY: gen-api
gen-api: ## gen api code of {svc}. example: make gen-api svc=user
	@cd app/${svc}/api && goctl api go --api ./${svc}.api --dir=. --style=gozero --module github.com/XJTU-zxc/easy-chat/app/${svc}/api

.PHONY: gen-model
gen-model: ## gen model code of {svc}. example: make gen-model svc=user
	@goctl model mysql ddl -src="./deploy/sql/${svc}.sql" -dir="./app/${svc}/model" -c