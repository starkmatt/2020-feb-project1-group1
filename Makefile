.PHONY: test
test:
	echo Testing...
	terraform validate
	terraform fmt



.PHONY: build
build:
	echo Building...
	cd terraform && REPO=$(terraform output repository_url)
	cd docker_files && docker build -f -t ${REPO} .



.PHONY: deploy
deploy: terraform-ecr-deploy build docker-container-deploy terraform-deploy
	echo Deploying...

.PHONY: terraform-init
terraform-init: terraform-init
	cd terraform && terraform init

.PHONY: terraform-ecr-deploy
terraform-ecr-deploy: terraform-init
	cd terraform && terraform apply --target module.aws-ecr

.PHONY: docker-container-deploy
docker-container-deploy: build
	docker push ${REPO}

.PHONY: terraform-deploy
terraform-ecr-deploy: terraform-init
	cd terraform && terraform apply
