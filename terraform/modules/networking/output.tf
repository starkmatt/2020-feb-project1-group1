output "subnet_private_ids" {
  value = [for subnet in aws_subnet.private: subnet.id]
}