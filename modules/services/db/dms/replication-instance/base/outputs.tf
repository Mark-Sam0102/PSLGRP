output "arn" {
  value       = aws_dms_replication_instance.main.replication_instance_arn
  description = "The ARN of replication instance."
}

output "private_ips" {
  value       = aws_dms_replication_instance.main.replication_instance_private_ips
  description = "A list of the private IP addresses of the replication instance."
}

output "public_ips" {
  value       = aws_dms_replication_instance.main.replication_instance_public_ips
  description = "A list of the public IP addresses of the replication instance."
}

output "id" {
  value       = aws_dms_replication_instance.main.replication_instance_id
  description = "Name of the replication instance."
}
