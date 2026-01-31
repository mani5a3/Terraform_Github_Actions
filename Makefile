TF=terraform

.PHONY: init validate plan apply plan-destroy destroy

init:
	@echo "==> Initializing Terraform"
	@rm -rf .terraform
	@$(TF) init -upgrade -no-color

validate: init
	@echo "==> Validating Terraform configuration"
	@$(TF) validate -no-color

plan: validate
	@echo "==> Running Terraform plan"
	@$(TF) plan -no-color

apply: plan
	@echo "==> Applying Terraform changes"
	@$(TF) apply -auto-approve -no-color

plan-destroy: validate
	@echo "==> Running Terraform plan (destroy)"
	@$(TF) plan -destroy -no-color

destroy: init
	@echo "==> Destroying Terraform resources"
	@$(TF) destroy -auto-approve -no-color
