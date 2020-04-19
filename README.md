# Project 01 - Group 01 - Wordpress Solution 

Solution based on AWS to install wordpress site with Fargate and Aurora DB Cluster. 

# Solution Diagram 

![](docs/devops-image-diagram-project-01.png)

# Instalation Requirements 

- Make
- Docker-compose 
- Git

# Instruction 

Coming soon 




# Push image to docker repository
aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin ${docker_repository_name}

docker build -t wordpress:v1 -f Dockerfile-wordpress .

docker tag wordpress:v1 ${docker_repository_name}:wordpress

docker push ${docker_repository_name}:wordpress
