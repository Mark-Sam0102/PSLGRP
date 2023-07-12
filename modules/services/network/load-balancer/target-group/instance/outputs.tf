output "arn" {
  value       = module.main.arn
  description = "ARN of the Target Group"
}
output "id" {
  value       = module.main.id
  description = "Id of the Target Group"
}
output "attachment_id" {
  value       = aws_lb_target_group_attachment.main[*].id
  description = "A unique identifier for the Target Group attachment"
}
