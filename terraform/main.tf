# Module ECR
module "aws-ecr" {
  source = "./modules/aws-ecr"
}

# Aurora
/*
resource "aws_rds_cluster" "wordpress" {
  cluster_identifier      = "aurora-mysql-wordpress"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.07.2"
  availability_zones      = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  database_name           = "wordpress"
  master_username         = var.username
  master_password         = var.pass
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}
*/

# MySQL Free Tier Test
resource "aws_db_instance" "mysql-wordpress" {
  allocated_storage    = 20
  identifier           = "db-wordpress"
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "wordpress"
  username             = var.username
  password             = var.pass
  parameter_group_name = "default.mysql5.7"
  publicly_accessible = "true"
  availability_zone = "ap-southeast-2a"
  final_snapshot_identifier = "snapshot"
}