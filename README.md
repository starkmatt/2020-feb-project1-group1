2020-feb-project1-group1 - Wordpress

# Module ECR Repository - Terraform
/terraform/modules/aws-ecr

# Docker Files
/docker_files

# Push image to docker repository
aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin ${docker_repository_name}

docker build -t wordpress:v1 -f Dockerfile-wordpress .

docker tag wordpress:v1 ${docker_repository_name}:wordpress

docker push ${docker_repository_name}:wordpress

# Cluster ECS
/modules/aws-ecs-cluster

# Create Task definition
/modules/aws-ecs-task-def
/modules/aws-ecs-service

# RDS Module

# CloudWatch Module






