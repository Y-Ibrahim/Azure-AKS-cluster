# Makefile

SUBSCRIPTION_ID=
SSH_KEY=

bootstrap-backend-plan:
ifeq ($(SUBSCRIPTION_ID),)
	$(error "SUBSCRIPTION_ID must be set")
endif
	cd bootstrap && \
	terraform init && \
	terraform plan \
		-var="subscription_id=$(SUBSCRIPTION_ID)" \


bootstrap-backend-apply:
ifeq ($(SUBSCRIPTION_ID),)
	$(error "SUBSCRIPTION_ID must be set")
endif
	cd bootstrap && \
	terraform init && \
	terraform apply \
		-var="subscription_id=$(SUBSCRIPTION_ID)" \



bootstrap-backend-destroy:
ifeq ($(SUBSCRIPTION_ID),)
	$(error "SUBSCRIPTION_ID must be set")
endif
	cd bootstrap && \
	terraform init && \
	terraform destroy \
		-var="subscription_id=$(SUBSCRIPTION_ID)"



test-plan:
	cd environments/test && \
	terraform init && \
	terraform plan \
	-var="subscription_id=$(SUBSCRIPTION_ID)" \
	-var="ssh_key=$(SSH_KEY)"

test-apply:
	cd environments/test && \
	terraform init && \
	terraform apply \
		-var="subscription_id=$(SUBSCRIPTION_ID)" \
		-var="ssh_key=$(SSH_KEY)"

test-destroy:
	cd environments/test && \
	terraform init && \
	terraform destroy \
		-var="subscription_id=$(SUBSCRIPTION_ID)" \
		-var="ssh_key=$(SSH_KEY)"
