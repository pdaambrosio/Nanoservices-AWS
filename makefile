all: help

help:
	@echo Makefile for generating infrastructure and nanoservices
	@echo 
	@echo Usage:
	@echo '	make lint			= execute file validation in terraform'
	@echo '	make plan			= execute terraform plan'
	@echo '	make terraform_deploy		= execute terraform deploy'
	@echo '	make terraform_destroy		= execute terraform destroy'
	@echo '	make serverless_deploy		= execute serverless deploy (depends on terraform deployment)'
	@echo '	make deploy			= deploy all terraform infrastructure and nanoservices with serverless framework'
	@echo '	make infra			= deploy only terraform infrastructure'
	@echo '	make destroy			= destroy all terraform infrastructure and nanoservices'
	@echo

deploy: lint plan terraform_deploy serverless_deploy

lint:
	@echo "\nTerraform lint (fmt and validate)\n"
	@cd infra ;\
	terraform fmt ;\
	terraform validate -json

plan:
	@echo "\nTerraform plan\n"
	@cd infra ;\
	terraform plan

terraform_deploy:
	@echo "\nTerraform deploy\n"
	@cd infra ;\
	terraform apply -auto-approve 

terraform_destroy:
	@echo "\nTerraform destroy\n"
	@cd infra ;\
	terraform destroy -auto-approve 

serverless_deploy:
	@echo "\nServerless deploy\n"
	for dir in $$(ls |egrep 'handler|tagging'); do (cd "$$dir" && serverless deploy --aws-profile pdajgs); done

destroy:
	@echo "\nDetroy all\n"
	@cd infra ;\
	terraform destroy --auto-approve
	for dir in $$(ls |egrep 'handler|tagging'); do (cd "$$dir" && serverless remove --aws-profile pdajgs); done

.ONESHELL:
