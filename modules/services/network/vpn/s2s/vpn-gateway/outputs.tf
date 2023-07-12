output "id" {
  value       = aws_vpn_gateway.main.id
  description = "ID of the VPN Gateway"
}

output "arn" {
  value       = aws_vpn_gateway.main.arn
  description = "Amazon Resource Name (ARN) of the VPN Gateway"
}

output "amazon_side_asn" {
  value       = aws_vpn_gateway.main.amazon_side_asn
  description = "The Autonomous System Number (ASN) for the Amazon side of the gateway"
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
