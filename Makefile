.PHONY: help

help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | sort | fgrep -v fgrep | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

docs: ## Create the docs of project
	@ rm -rf docs
	@ mix deps.get
	@ mix docs --output docs

test:	## Test the application
	@ mix test