output "arn" {
  value       = aws_subnet.main.arn
  description = "The ARN of the subnet."
}
output "id" {
  value       = aws_subnet.main.id
  description = "The ID of the subnet"
}
output "address_space" {
  value       = var.address_space
  description = "The CIDR block for the subnet."
}
output "subnet_id" {
  value = aws_subnet.main.id
}
# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
