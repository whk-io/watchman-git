# watchman-git Makefile
# created by Hunter Kirk
# version v1.1.1
# https://github.com/whk-io/watchman-git

WORKDIR := $(shell pwd)

.PHONY: help list list-triggers start stop trigger state log monitor build debug run

help:
	clear
	@printf "Makefile options:\n"
	@printf "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)\n"

list: ## List watchman watched folders
	watchman watch-list

list-triggers: ## List triggers for current folder
	watchman trigger-list $(WORKDIR)

start: ## Start watching current folder
	watchman watch $(WORKDIR)

stop: ## Stops watching the current folder
	watchman watch-del $(WORKDIR)

trigger: ## Create trigger for current folder
	watchman -- trigger $(WORKDIR) trigger_name * -- $(WORKDIR)/trigger.sh

state: ## View watchman state
	cat /usr/local/var/run/watchman/$(USER)-state/state

log: ## View watchman log
	cat /usr/local/var/run/watchman/$(USER)-state/log

monitor: ## Stream active log
	tail -f /usr/local/var/run/watchman/$(USER)-state/log

build: ## Build watchman-git container
	docker build -t watchman-git:latest .

debug: ## Run container for debugging.
	docker run -it -v $(shell pwd):/root -v ssh:/root/.ssh/ --entrypoint /bin/bash watchman-git:latest

run: ## Run container and start a watch and trigger.
	docker run -it -v $(shell pwd):/root watchman-git:latest
	
