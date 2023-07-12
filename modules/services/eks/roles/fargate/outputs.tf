output "arn" {
  value       = module.fargate_profile_role.arn
  description = "Amazon Resource Name (ARN) of the IAM Role of EKS Fargate Profile"
}
output "id" {
  value       = module.fargate_profile_role.id
  description = "ID of IAM Role of EKS Fargate Profile"
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>