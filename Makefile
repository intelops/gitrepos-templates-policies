.PHONY: install

install:
	@command -v pre-commit >/dev/null 2>&1 || { \
		echo "pre-commit is not installed. Installing it..."; \
		pip install pre-commit; \
		echo "pre-commit installed successfully."; \
	}
	@echo "pre-commit is installed."

# Default target
default: install
