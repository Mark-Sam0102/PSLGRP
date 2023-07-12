output "service_name" {
  description = "The service name"
  value       = local.service_name
}

output "cluster_arn" {
  description = "ARN of the cluster."
  value       = module.eks_cluster.arn
}

output "endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks_cluster.endpoint
}
output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks_cluster.cluster_security_group_id
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks_cluster.id
}
output "kubeconfig_certificate_authority" {
  description = "kubeconfig attribute block containing certificate-authority-data for eks cluster."
  value       = module.eks_cluster.kubeconfig_certificate_authority[0].data
}
output "oidc" {
  value = module.eks_cluster.oidc
}
output "oidc_provider_arn" {
  value = module.eks_cluster.oidc_provider_arn
}
output "platform_version" {
  value = module.eks_cluster.platform_version
}
output "vpc_config-subnet_ids" {
  value = local.public_subnet_ids
}
output "vpc_config-vpc_id" {
  value = local.vpc_id
}
# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
