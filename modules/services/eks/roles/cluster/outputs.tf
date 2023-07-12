output "arn" {
  value       = module.eks_cluster_role.arn
  description = "ARN of EKS cluster"
}
output "id" {
  value       = module.eks_cluster_role.id
  description = "ID of EKS cluster"
}
