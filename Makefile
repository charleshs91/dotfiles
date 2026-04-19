SHELL := /bin/bash

.PHONY: help setup macos neovim doctor check

help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@echo "  help    - Show this help message"
	@echo "  setup   - Clone required repositories"
	@echo "  neovim  - Install Neovim configuration"
	@echo "  macos   - Install symlinks for macOS environment"
	@echo "  doctor  - Check required tools and config"
	@echo "  check   - Dry-run stow operations"

setup:
	bash scripts/clone-repos.sh

macos: setup neovim
	bash scripts/macos.sh

neovim:
	bash scripts/neovim.sh

doctor:
	bash scripts/doctor.sh

check:
	bash scripts/check.sh
