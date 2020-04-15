# AWS Cluster
resource "aws_ecs_cluster" "project_1" {
  name = "project_1"

  tags = {
     Environment = "Project1 - Dev"
  }  
}