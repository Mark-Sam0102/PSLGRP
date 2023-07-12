output "id" {
  value       = aws_vpn_connection.main.id
  description = "Amazon-assigned ID of the VPN connection"
}

output "arn" {
  value       = aws_vpn_connection.main.arn
  description = "Amazon Resource Name (ARN) of the VPN Connection"
}
