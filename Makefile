# help: @ Lists available make tasks
help:
	@egrep -oh '[0-9a-zA-Z_\.\-]+:.*?@ .*' $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?@ "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' | sort

# node_modules: @ Runs initial ui npm install
node_modules:
	docker-compose run ui npm install

# ui.build: @ Builds ui production output (to build/ui-bundle.zip)
ui.build: node_modules
	docker-compose run -u $$(id -u) ui node_modules/.bin/gulp bundle

# ui.lint: @ Runs ui linting
ui.lint: node_modules
	docker-compose run -u $$(id -u) ui node_modules/.bin/gulp lint

# ui.run: @ Runs ui server in preview mode (on port 8052)
ui.run: node_modules
	docker-compose run -u $$(id -u) --service-ports ui node_modules/.bin/gulp preview

# ui.shell: @ Opens bash shell in ui container
ui.shell: CMD ?= /bin/bash
ui.shell:
	docker-compose run -u $$(id -u) ui $(CMD)
