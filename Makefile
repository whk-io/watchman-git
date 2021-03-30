# watchman-git Makefile
# created by Hunter Kirk
# version v2.0.1
# https://github.com/whk-io/watchman-git

WORKDIR := $(shell pwd)

.PHONY: help list list-triggers start stop trigger state log monitor build debug run

help:
	clear
	@printf "Makefile options:\n"
	@printf "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)\n"

build: ## Build watchman-git container
	docker build -t watchman-git:latest container/

debug: ## Run container for debugging.
	docker run -it -v $(shell pwd):/root -v /Volumes/8TB01/Keystore:/root/.ssh/ --entrypoint /bin/bash watchman-git:latest

run: ## Run container and start a watch and trigger.
	docker run -it -v $(shell pwd):/root -v /Volulmes/8TB01/Keystore:/root/.ssh/ watchman-git:latest
	
