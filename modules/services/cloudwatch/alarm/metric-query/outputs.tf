output "id" {
  value       = aws_cloudwatch_metric_alarm.main.id
  description = "The ID of alarm."
}

output "arn" {
  value       = aws_cloudwatch_metric_alarm.main.arn
  description = "The ARN of alarm."
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
