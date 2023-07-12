output "arn" {
  value       = module.node_group_role.arn
  description = "Amazon Resource Name (ARN) of the IAM Role of EKS Node Group"
}
output "id" {
  value       = module.node_group_role.id
  description = "ID of IAM Role of EKS Node Group"
}
