# AWS Cluster
resource "aws_ecs_cluster" "project_1" {
  name = var.project_name

  tags = {
    Environment = var.project_env
  }
}