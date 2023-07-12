output "id" {
  value       = aws_eip.main.id
  description = "ID of the resource"
}

output "public_ip" {
  value       = aws_eip.main.public_ip
  description = "The public IP address."
}
