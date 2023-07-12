output "endpoint" {
  value       = aws_eks_cluster.main.endpoint
  description = "Endpoint for your Kubernetes API server"
}
output "id" {
  value       = aws_eks_cluster.main.id
  description = "Name of the cluster."
}
output "arn" {
  value       = aws_eks_cluster.main.arn
  description = "ARN of the cluster."
}
output "vpc_id" {
  value       = aws_eks_cluster.main.vpc_config[0].vpc_id
  description = "ID of the VPC associated with your cluster."
}
output "cluster_security_group_id" {
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  description = "Managed node groups use this Cluster security group for control-plane-to-data-plane communication."
}
output "kubeconfig_certificate_authority" {
  value       = aws_eks_cluster.main.certificate_authority
  description = "Attribute block containing certificate-authority-data for your cluster."
}
output "oidc" {
  value       = aws_eks_cluster.main.identity[0].oidc[0].issuer
  description = "Issuer URL for the OpenID Connect identity provider."
}
output "oidc_provider_arn" {
  value       = aws_iam_openid_connect_provider.main.arn
  description = "The ARN assigned by AWS for this provider."
}
output "platform_version"{
  value = aws_eks_cluster.main.platform_version
}
# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
