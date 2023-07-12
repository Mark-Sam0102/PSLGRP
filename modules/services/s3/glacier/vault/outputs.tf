output "arn" {
  value       = aws_glacier_vault.main.arn
  description = "ARN of the vault"
}

output "uri" {
  value       = aws_glacier_vault.main.location
  description = "URI of the vault that was created"
}
