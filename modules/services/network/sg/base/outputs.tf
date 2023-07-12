output "id" {
  value       = aws_security_group.main.id
  description = "ID of the resource"
}

output "arn" {
  value       = aws_security_group.main.arn
  description = "ARN of the security group."
}
