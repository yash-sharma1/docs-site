all: serve

########################################
### CI

ci: build

########################################
### Submodules
submodules:
	@echo "--> Installing submodules"
	git submodule init
	git submodule update

########################################
### Build

build:
	@echo "--> Building docs site"
	mkdocs

serve:
	@echo "--> Serving docs site"
	mkdocs serve

########################################
### Build other docs

build-swagger2markup: submodules
	@echo "--> Building swagger2markup-cli"
	cd utils/swagger2markup-cli && gradle assemble

build-html-apidocs:
	swagger-codegen generate -i swagger.yml -l html -o ./docs-html/dex-api

########################################
### Swagger
swagger-docs: build-swagger2markup
	@echo "--> Generating dex-api docs from swagger.yml"
	java -jar ./utils/swagger2markup-cli/build/libs/swagger2markup-cli-1.3.3.jar convert -i ./swagger.yml -d ./docs/api-reference/dex-api -c ./utils/swagger2markup.config.properties

########################################

# To avoid unintended conflicts with file names, always add to .PHONY
# unless there is a reason not to.
# https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: submodules build serve build-swagger2markup swagger-docs
