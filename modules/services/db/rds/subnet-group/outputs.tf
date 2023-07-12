
output "id" {
  value       = aws_db_subnet_group.main.id
  description = "ID of the resource"
}

output "name" {
  value       = aws_db_subnet_group.main.name
  description = "The resource name."
}
