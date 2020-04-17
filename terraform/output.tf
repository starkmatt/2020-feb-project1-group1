output "db_fqdn" {
  value = aws_db_instance.mysql-wordpress.endpoint
}

output "repository_url" {
  value = module.aws-ecr.repository_url
}
