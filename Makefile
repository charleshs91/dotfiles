.PHONY: help
help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@echo "  macos - Stow macOS items"

.PHONY: setup
setup:
	. scripts/clone-repos.sh

.PHONY: macos
macos: setup neovim
	. scripts/macos.sh

.PHONY: neovim
neovim:
	. scripts/neovim.sh
