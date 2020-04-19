module "aws-ecr" {
  source = "./modules/aws-ecr"
  project_name = var.project_name
}

module "aws-ecs-cluster" {
  source = "./modules/aws-ecs-cluster"
}

module "aws-ecs-task-def" {
  source = "./modules/aws-ecs-task-def"
}

module "aws-ecs-service" {
  source = "./modules/aws-ecs-service"

  cluster_id = module.aws-ecs-cluster.id
  task_arn   = module.aws-ecs-task-def.arn
  project_name = var.project_name
  subnet_ids   = module.networking.subnet_private_ids
}

module "networking" {
  source        = "./modules/networking"
  project_name  = var.project_name
  cidr_vpc      = var.cidr_vpc
  sysadmin_cidr = var.sysadmin_cidr
}

resource "aws_db_subnet_group" "wordpress" {
  name       = "${var.project_name}_wordpress"
  subnet_ids = module.networking.subnet_private_ids
}

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
  db_subnet_group_name      = aws_db_subnet_group.wordpress.name
}
