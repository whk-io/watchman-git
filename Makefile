WORKDIR := $(shell pwd)

.PHONY: help list list-triggers watch watch-stop trigger view-state view-log monitor-log

help:
	clear
	@printf "Makefile options:\n"
	@printf "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)\n"

list: ## List watchman watched folders
	watchman watch-list

list-triggers: ## List triggers for current folder
	watchman trigger-list $(WORKDIR)

watch: ## Start watching current folder
	watchman watch $(WORKDIR)

watch-stop: ## Stops watching the current folder
	watchman watch-del $(WORKDIR)

trigger: ## Create trigger for current folder
	watchman -- trigger $(WORKDIR) trigger_name * -- $(WORKDIR)/trigger.sh

view-state: ## View watchman state
	cat /usr/local/var/run/watchman/$(USER)-state/state

view-log: ## View watchman log
	cat /usr/local/var/run/watchman/$(USER)-state/log

monitor-log: ## Stream active log
	tail -f /usr/local/var/run/watchman/$(USER)-state/log

