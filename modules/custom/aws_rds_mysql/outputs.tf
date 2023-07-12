output "service_name" {
  value = local.service_name
}

output "instance_id" {
  description = "The RDS instance ID"
  value       = module.rds_mysql.id
}

output "password" {
  value     = local.password
  sensitive = true
}

output "instance_address" {
  description = "The address of the RDS instance"
  value       = module.rds_mysql.address
}

output "instance_endpoint" {
  description = "The connection endpoint"
  value       = module.rds_mysql.endpoint
}

output "instance_name" {
  description = "The database name"
  value       = module.rds_mysql.id
}

output "instance_port" {
  description = "The database port"
  value       = module.rds_mysql.port
}