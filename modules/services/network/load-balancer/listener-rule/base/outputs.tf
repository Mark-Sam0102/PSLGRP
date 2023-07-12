output "id" {
  value       = aws_lb_listener_rule.main.id
  description = "Id of the provisioned listener rule"
}

output "arn" {
  value       = aws_lb_listener_rule.main.arn
  description = "ARN of the provisioned listener rule"
}
