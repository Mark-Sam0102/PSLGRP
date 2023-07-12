output "id" {
  value       = aws_db_instance.main.id
  description = "ID of the resource"
}
output "arn" {
  value       = aws_db_instance.main.arn
  description = "The ARN (Amazon Resource Name) for the resource"
}
output "address" {
  value       = aws_db_instance.main.address
  description = "The hostname of the RDS instance. See also endpoint and port."
}
output "port" {
  value       = aws_db_instance.main.port
  description = "The database port."
}
output "endpoint" {
  value       = aws_db_instance.main.endpoint
  description = "The connection endpoint in address:port format."
}
output "db_name" {
  value       = aws_db_instance.main.db_name
  description = "The database name."
}
