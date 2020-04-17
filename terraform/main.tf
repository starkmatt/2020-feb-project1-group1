# Module ECR
module "aws-ecr" {
  source = "./modules/aws-ecr"
}

# Module ECS Cluster
module "aws-ecs-cluster" {
  source = "./modules/aws-ecs-cluster"
}

# Module ECS Task Definition
module "aws-ecs-task-def" {
  source = "./modules/aws-ecs-task-def"
}

# Module ECS Service
module "aws-ecs-service" {
  source = "./modules/aws-ecs-service"

  cluster_id = module.aws-ecs-cluster.id
  task_arn   = module.aws-ecs-task-def.arn
}

# MySQL Free Tier Test
resource "aws_db_instance" "mysql-wordpress" {
  allocated_storage         = 20
  identifier                = "db-wordpress"
  storage_type              = "gp2"
  engine                    = "mysql"
  engine_version            = "5.7"
  instance_class            = "db.t2.micro"
  name                      = "wordpress"
  username                  = var.username
  password                  = var.pass
  parameter_group_name      = "default.mysql5.7"
  publicly_accessible       = "true"
  availability_zone         = "ap-southeast-2a"
  final_snapshot_identifier = "snapshot"
}
