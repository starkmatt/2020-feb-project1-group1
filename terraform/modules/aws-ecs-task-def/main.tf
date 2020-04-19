# AWS Task Definition
resource "aws_ecs_task_definition" "project_1" {
  family                   = var.family
  container_definitions    = file(var.container_definition_file)
  requires_compatibilities = var.requires_compatibilities
  cpu                      = var.cpu
  memory                   = var.memory
  network_mode             = var.network_mode
  tags                     = var.tags

  volume {
    name = var.volume

    docker_volume_configuration {
      scope         = var.volume_scope
      autoprovision = var.volume_autoprovision
      driver        = var_volume_driver

      driver_opts = {
        "type"   = var.file_system_type
        "device" = "${var.file_system_dns_name}:/"
        "o"      = "addr=${var.file_system_dns_name},rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport"
      }
    }
  }
}
