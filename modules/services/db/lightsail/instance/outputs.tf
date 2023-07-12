output "id" {
  value       = aws_lightsail_instance.main.id
  description = "The ARN of the Lightsail instance"
}

output "arn" {
  value       = aws_lightsail_instance.main.arn
  description = "The ARN of the Lightsail instance"
}

output "public_ip_address" {
  value       = aws_lightsail_instance.main.public_ip_address
  description = "The public IP address of the instance"
}

output "private_ip_address" {
  value       = aws_lightsail_instance.main.private_ip_address
  description = "The private IP address of the instance"
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>