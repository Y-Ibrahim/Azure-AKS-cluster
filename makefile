# Makefile

SUBSCRIPTION_ID=

bootstrap-backend:
ifeq ($(SUBSCRIPTION_ID),)
	$(error "SUBSCRIPTION_ID must be set")
endif
	cd bootstrap && \
	terraform init && \
	terraform plan -var="subscription_id=$(SUBSCRIPTION_ID)"
