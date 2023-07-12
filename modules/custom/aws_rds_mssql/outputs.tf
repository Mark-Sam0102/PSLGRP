output "service_name" {
  value = local.service_name
}

output "password" {
  value     = local.password
  sensitive = true
}

output "instance_address" {
  description = "The address of the RDS instance"
  value       = module.sqlserver.address
}

output "instance_endpoint" { 
  description = "The connection endpoint "
  value= module.sqlserver.endpoint
}

output "instance_name" {
  description = "The database name "
  value = module.sqlserver.id
}

output "instance_port" {
  description = "The database port "
  value = module.sqlserver.port
}
