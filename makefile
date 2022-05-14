all: help

help:
	@echo Makefile for generating infrastructure and nanoservices
	@echo 
	@echo Usage:
	@echo '	make lint			= run file validation in terraform'
	@echo '	make plan			= run terraform plan'
	@echo '	make terraform_deploy		= run terraform deploy'
	@echo '	make serverless_deploy		= run serverless deploy (depends on terraform deployment)'
	@echo '	make terraform_destroy		= run terraform destroy'
	@echo '	make serverless_destroy		= run serverless remove'
	@echo '	make build			= run npm install in all application directories'
	@echo '	make analyze			= run terraform fmt, validate and serverless doctor'
	@echo '	make deploy			= deploy all terraform infrastructure and nanoservices with serverless framework'
	@echo '	make destroy			= destroy all terraform infrastructure and nanoservices'
	@echo

RED='\033[0;31m'
NC='\033[0m'

build: npm_install
analyze: lint plan
deploy: terraform_deploy serverless_deploy
destroy: serverless_destroy terraform_destroy 

lint:
	@echo "\nTerraform lint (fmt and validate) and Serverless doctor\n"
	@cd infra;\
	terraform fmt -recursive;\
	terraform validate
	@for dir in $$(ls |egrep 'handler|tagging'); do (cd "$$dir" && echo ${RED}"\nApplication: $$dir"${NC} && serverless doctor); done

plan:
	@echo "\nTerraform plan\n"
	@cd infra;\
	terraform plan;\
	terraform get

npm_install:
	@echo "\nInstall Dependencies\n"
	@for dir in $$(ls |egrep 'handler|tagging'); do (cd "$$dir" && echo ${RED}"\nApplication: $$dir"${NC} && npm install); done

terraform_deploy:
	@echo "\nTerraform deploy\n"
	@cd infra ;\
	terraform apply -auto-approve 

serverless_deploy:
	@echo "\nServerless deploy\n"
	@for dir in $$(ls |egrep 'handler|tagging'); do (cd "$$dir" && echo ${RED}"\nApplication: $$dir"${NC} && serverless deploy --aws-profile terraform); done

terraform_destroy:
	@echo "\nTerraform destroy\n"
	@cd infra;\
	terraform destroy -auto-approve 

serverless_destroy:
	@echo "\nServerless destroy\n"
	@for dir in $$(ls |egrep 'handler|tagging'); do (cd "$$dir" && echo ${RED}"\nApplication: $$dir"${NC} && serverless remove --aws-profile terraform); done
