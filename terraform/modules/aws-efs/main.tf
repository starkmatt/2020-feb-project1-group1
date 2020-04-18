resource "aws_efs_file_system" "project_1" {
  creation_token = "wordpress"
  encrypted ="false"

  tags = {
    Name = var.project_name
  }
}

resource "aws_efs_mount_target" "project_1" {
  count          = length(var.subnet_ids)
  subnet_id      = var.subnet_ids[count.index]
  file_system_id = aws_efs_file_system.project_1.id
}