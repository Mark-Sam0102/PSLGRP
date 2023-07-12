output "vpc_id" {
  value       = aws_dms_replication_subnet_group.main.vpc_id
  description = "The ID of the VPC the subnet group is in."
}