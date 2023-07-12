
output "id" {
  value       = aws_db_parameter_group.main.id
  description = "ID of the resource"
}

output "name" {
  value       = aws_db_parameter_group.main.name
  description = "name of the resource"
}
