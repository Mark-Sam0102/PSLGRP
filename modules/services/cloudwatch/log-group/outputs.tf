output "arn" {
  value       = aws_cloudwatch_log_group.main.arn
  description = "The Amazon Resource Name (ARN) resource"
}
output "name" {
  value       = aws_cloudwatch_log_group.main.name
  description = "name of the resource"
}
