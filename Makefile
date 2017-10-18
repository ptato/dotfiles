INCLUDE  := $(wildcard .??*)
IGNORE   := .git .gitmodules %.swp
DOTFILES := $(filter-out $(IGNORE), $(INCLUDE))

.PHONY: list update install clean help
.DEFAULT_GOAL := help

list: ## Show the dotfiles to be installed
	@$(foreach val, $(DOTFILES), ls -dF $(val);)

update: ## Fetch changes from github.com
	git pull origin master

install: ## Create symlinks in home directory
	@$(foreach val, $(DOTFILES), ln -fsv $(abspath $(val)) $(HOME)/$(val);)

clean: ## Remove symlinks from home directory
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)

help: ## Show this help information
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "};{printf "\033[36m%-30s\033[0m %s\n",$$1,$$2}'
