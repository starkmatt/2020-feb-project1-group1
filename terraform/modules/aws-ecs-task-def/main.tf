# AWS Task Definition
resource "aws_ecs_task_definition" "project_1" {
  family                   = "wordpress"
  container_definitions    = var.container_definitions
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  network_mode             = "awsvpc"

  tags = {
    Environment = "Project1 - Dev"
  }

}