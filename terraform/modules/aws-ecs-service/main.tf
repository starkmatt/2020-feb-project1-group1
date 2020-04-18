resource "aws_ecs_service" "ecs" {
  name            = var.project_name
  cluster         = var.cluster_id
  task_definition = var.task_arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    assign_public_ip = "true"
    subnets = var.subnet_ids
  }
}