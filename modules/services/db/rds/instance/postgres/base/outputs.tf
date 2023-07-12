
output "id" {
  value       = module.main.id
  description = "ID of the resource"
}
output "arn" {
  value       = module.main.arn
  description = "The ARN (Amazon Resource Name) for the resource"
}
output "address" {
  value       = module.main.address
  description = "The hostname of the RDS instance. See also endpoint and port."
}
output "port" {
  value       = module.main.port
  description = "The database port."
}
output "endpoint" {
  value       = module.main.endpoint
  description = "The connection endpoint in address:port format."
}
output "db_name" {
  value       = module.main.db_name
  description = "The database name."
}
