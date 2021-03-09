# More robust scripts
export SHELL = /bin/bash
export SHELLOPTS := errexit:pipefail:nounset

# Suppress redundant messages.
export TF_IN_AUTOMATION = 1

# Use one shell instance to execute all steps in a target.
.ONESHELL:
# Don't echo commands for cleaner output.
.SILENT:

help:
	echo -e \
	"This Makefile helps you to use terraform commands in a easy way"

init: 
	terraform init

plan:
	terraform plan \
		-input=false \
		-var-file=my.tfvars \
		-out=my.tfplan

apply:
	terraform apply my.tfplan

destroy:
	terraform destroy -var-file=my.tfvars
