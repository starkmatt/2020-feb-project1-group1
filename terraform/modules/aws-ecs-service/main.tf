#AWS ECS Service
resource "aws_ecs_service" "project_1" {
  name            = "project_1"
  cluster         = var.cluster_id
  task_definition = var.task_arn
  launch_type     = "FARGATE"
  desired_count   = 1
/*
  iam_role        = "${aws_iam_role.foo.arn}"
  depends_on      = ["aws_iam_role_policy.foo"]
*/
  network_configuration {
    assign_public_ip = "true"
    subnets = ["subnet-0a446d9e47b3ea3ac", "subnet-0ffe987e71765b443"]
  }

}