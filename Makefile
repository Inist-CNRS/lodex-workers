.PHONY: build help
.DEFAULT_GOAL := help

help:
	@grep -P '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## build the docker image localy
	docker build -t touv/ezs --build-arg http_proxy --build-arg https_proxy .
run: ## run ezs daemon
	docker run --net=host -e NODE_ENV -e http_proxy -e https_proxy -p 31976:31976 touv/ezs

