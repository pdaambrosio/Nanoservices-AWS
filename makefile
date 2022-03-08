all: help

help:
	@echo 'Makefile for generating infrastructure and nanoservices			          													'
	@echo '                                                                          													'
	@echo 'Usage:                                                                    													'
	@echo '   make terraform_lint				  perform file validation in terraform													'
	@echo '   make deploy                         deploy all terraform infrastructure and nanoservices with serverless framework		'
	@echo '   make infra                          deploy only terraform infrastructure													'
	@echo '   make destroy                        destroy all terraform infrastructure and nanoservices 								'
	@echo '                                                                          													'

deploy: terraform_lint terraform_plan

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

destroy:
	@echo "\nDetroy all\n"
	@cd infra ;\
	terraform destroy --auto-approve
