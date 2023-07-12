output "public_subnet_id" {
  value       = module.subnet_public.id
  description = "The ID of the public subnet"
}
output "private_subnet_id" {
  value       = module.subnet_private.id
  description = "The ID of the private subnet"
}
output "public_subnet_route_table_id" {
  value       = module.subnet_public.route_table_id
  description = "The ID of the route table for public subnet"
}
output "private_subnet_route_table_id" {
  value       = module.subnet_private.route_table_id
  description = "The ID of the route table for private subnet"
}
