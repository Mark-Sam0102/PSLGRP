output "arn" {
  value       = aws_globalaccelerator_listener.main.id
  description = "The Amazon Resource Name (ARN) of the listener."
}

output "endpoints" {
  value = [for s in aws_globalaccelerator_endpoint_group.main : {
    id  = s.id
    arn = s.arn
  }]
  description = "Global Accelerator Endpoint Group IDs and ARNs."
}

# © 2023 Persistent Systems, <cloud-automation-stack@persistent.com>
