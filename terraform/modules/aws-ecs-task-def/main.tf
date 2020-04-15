# AWS Task Definition
resource "aws_ecs_task_definition" "project_1" {
  family                = "wordpress"
  container_definitions = var.container_definitions
  requires_compatibilities = ["FARGATE"]
  cpu = 256
  memory = 512
  network_mode = "awsvpc"


/*
#EFS
  volume {
    name = "service-storage"

    efs_volume_configuration {
      file_system_id = aws_efs_file_system.fs.id
      root_directory = "/opt/data"
    }
  }
}
*/

  tags = {
     Environment = "Project1 - Dev"
  }

}