output "id" {
  value       = aws_lb_listener.main.id
  description = "Id of the provisioned listener"
}

output "arn" {
  value       = aws_lb_listener.main.arn
  description = "ARN of the provisioned listener"
}
