.PHONY: help
help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@echo "  macos - Stow macOS items"

.PHONY: macos
macos:
	sh scripts/macos.sh
