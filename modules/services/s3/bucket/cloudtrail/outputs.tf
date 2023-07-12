output "id" {
  value       = module.main.id
  description = "The ID of the S3 bucket"
}
output "arn" {
  value       = module.main.arn
  description = "The Amazon Resource Name (ARN) of the S3 bucket"
}
output "object" {
  value = {
    id  = module.main.id
    arn = module.main.arn
  }
  description = "Important attributes of the resource such as ID and ARN as a single object / map"
}
