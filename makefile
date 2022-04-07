all: help

help:
	@echo Makefile for generating infrastructure and nanoservices
	@echo 
	@echo Usage:
	@echo '	make lint			= execute file validation in terraform'
	@echo '	make plan			= execute terraform plan'
	@echo '	make terraform_deploy		= execute terraform deploy'
	@echo '	make serverless_deploy		= execute serverless deploy (depends on terraform deployment)'
	@echo '	make terraform_destroy		= execute terraform destroy'
	@echo '	make serverless_destroy		= execute serverless remove'
	@echo '	make deploy			= deploy all terraform infrastructure and nanoservices with serverless framework'
	@echo '	make destroy			= destroy all terraform infrastructure and nanoservices'
	@echo

deploy: lint plan terraform_deploy serverless_deploy
destroy: serverless_destroy terraform_destroy 

lint:
	@echo "\nTerraform lint (fmt and validate) and Serverless doctor\n"
	@cd infra;\
	terraform fmt -recursive;\
	terraform validate -json
	@for dir in $$(ls |egrep 'handler|tagging'); do (cd "$$dir" && echo "\n$$dir" && serverless doctor); done

plan:
	@echo "\nTerraform plan\n"
	@cd infra;\
	terraform plan;\
	terraform get

terraform_deploy:
	@echo "\nTerraform deploy\n"
	@cd infra ;\
	terraform apply -auto-approve 

serverless_deploy:
	@echo "\nServerless deploy\n"
	@for dir in $$(ls |egrep 'handler|tagging'); do (cd "$$dir" && echo "\n$$dir" && serverless deploy --aws-profile terraform); done

terraform_destroy:
	@echo "\nTerraform destroy\n"
	@cd infra;\
	terraform destroy -auto-approve 

serverless_destroy:
	@echo "\nServerless destroy\n"
	@for dir in $$(ls |egrep 'handler|tagging'); do (cd "$$dir" && echo "\n$$dir" && serverless remove --aws-profile terraform); done
