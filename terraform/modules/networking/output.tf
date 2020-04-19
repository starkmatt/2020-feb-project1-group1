output "subnet_private_ids" {
  value = [for subnet in aws_subnet.private: subnet.id]
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "availability_zone_names" {
  value = data.aws_availability_zones.available.names
}
