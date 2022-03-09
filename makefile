all: help

help:
	@echo Makefile for generating infrastructure and nanoservices
	@echo 
	@echo Usage:
	@echo '	make terraform_lint	= execute file validation in terraform'
	@echo '	make terraform_plan	= execute terraform plan'
	@echo '	make terraform_deploy	= execute terraform deploy'
	@echo '	make deploy		= deploy all terraform infrastructure and nanoservices with serverless framework'
	@echo '	make infra		= deploy only terraform infrastructure'
	@echo '	make destroy		= destroy all terraform infrastructure and nanoservices'
	@echo

deploy: terraform_lint terraform_plan terraform_deploy serverless_deploy

terraform_lint:
	@echo "Terraform lint (fmt and validate)\n"
	@cd infra ;\
	terraform fmt ;\
	terraform validate -json

terraform_plan:
	@echo "\nTerraform plan\n"
	@cd infra ;\
	terraform plan

terraform_deploy:
	@echo "Terraform deploy"
	@cd infra ;\
	terraform apply -auto-approve 

serverless_deploy:
	@echo "\nServerless deploy\n"
	for dir in $$(ls |egrep 'handler|tagging'); do (cd "$$dir" && serverless deploy --aws-profile pdajgs); done

destroy:
	@echo "\nDetroy all\n"
	@cd infra ;\
	terraform destroy --auto-approve
	for dir in $(ls |egrep 'handler|tagging'); do (cd "$dir" && serverless remove --aws-profile pdajgs); done

.ONESHELL:
