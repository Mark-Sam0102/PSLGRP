output "arn" {
  value       = aws_dms_replication_task.main.replication_task_arn
  description = "The ARN of replication instance."
}