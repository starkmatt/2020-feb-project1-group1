# ECR Repository
resource "aws_ecr_repository" "project_1" {
  name = "project_1"

  image_scanning_configuration {
    scan_on_push = false
  }
 
   tags = {
     Environment = "Project1 - Dev"
   }
}