output "arn" {
  value       = aws_db_proxy.main.arn
  description = "Amazon Resource Name (ARN) for the proxy"
}

output "id" {
  value       = aws_db_proxy.main.id
  description = "ID for the proxy"
}

output "endpoint" {
  value       = aws_db_proxy.main.endpoint
  description = "Endpoint for the proxy"
}

output "name" {
  value       = aws_db_proxy.main.name
  description = "Name of the proxy"
}
