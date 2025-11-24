.PHONY: help
help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@echo "  macos - Stow macOS items"

.PHONY: stow-macos
stow-macos:
	sh ./stow_macos.sh
