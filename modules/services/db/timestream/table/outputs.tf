output "arn" {
  value       = aws_timestreamwrite_table.main.arn
  description = "The table ARN"
}

output "id" {
  value       = aws_timestreamwrite_table.main.id
  description = "The table ID"
}

# © 2023 Persistent Systems, <cloud-automation-stack@persistent.com>