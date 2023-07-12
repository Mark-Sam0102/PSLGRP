output "id" {
  value       = aws_globalaccelerator_accelerator.main.id
  description = "The Amazon Resource Name (ARN) of the accelerator"
}

output "dns_name" {
  value       = aws_globalaccelerator_accelerator.main.dns_name
  description = "The DNS name of the accelerator"
}

output "ip_sets" {
  value       = aws_globalaccelerator_accelerator.main.ip_sets
  description = "IP address set associated with the accelerator"
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
