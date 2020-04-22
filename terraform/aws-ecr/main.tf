resource "aws_ecr_repository" "ecr" {
  name = "wordpress"

  image_scanning_configuration {
    scan_on_push = false
  }

  tags = {
    Environment = var.project_name
  }
}
