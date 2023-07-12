#old outputs
output "log_group_arn" {
  value       = module.short_term.arn
  description = "The Amazon Resource Name (ARN) of the CloudWatch Log Group"
}
output "log_group_name" {
  value       = module.short_term.name
  description = "The Name of the CloudWatch Log Group"
}
output "bucket_id" {
  value       = module.long_term.id
  description = "The ID of the S3 Bucket"
}
output "bucket_arn" {
  value       = module.long_term.arn
  description = "The Amazon Resource Name (ARN) of the S3 Bucket"
}
#new outputs below
output "log_group" {
  value = {
    arn  = local.result.log_group.arn
    name = local.result.log_group.name
  }
  description = "The CloudWatch Log Group"
}
output "bucket" {
  value = {
    id  = local.result.bucket.id
    arn = local.result.bucket.arn
  }
  description = "The S3 bucket"
}
output "cloudwatch_log_publisher_policy" {
  value = {
    arn = local.result.cloudwatch_log_publisher_policy.arn
    id  = local.result.cloudwatch_log_publisher_policy.id
  }
  description = "The cloud watch log publisher policy info"
}
output "retention_policy" {
  value = {
    short_term = local.result.retention_policy.short_term
    long_term  = local.result.retention_policy.long_term
  }
  description = "Retains your configuration items for that specified period"
}
output "result" {
  value       = local.result
  description = "The Observability Settings"
}
