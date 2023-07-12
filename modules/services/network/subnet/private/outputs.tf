output "id" {
  value       = module.main.id
  description = "The ID of the subnet"
}
output "route_table_id" {
  value       = module.route.id
  description = "The ID of the route table"
}
