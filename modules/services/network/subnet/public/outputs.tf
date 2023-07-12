output "id" {
  value       = module.main.id
  description = "The ID of the subnet"
}
output "nat_gateway_id" {
  value       = module.nat_gateway.id
  description = "The ID of the NAT Gateway"
}
output "route_table_id" {
  value       = module.route.id
  description = "The ID of the route table"
}
output "arn" {
  value       = module.main.arn
  description = "The ARN of the subnet"

}
output "subnet_id" {
  value = module.main.id
}