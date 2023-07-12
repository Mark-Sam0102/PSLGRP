output "arn" {
  value       = aws_eks_node_group.main.arn
  description = " Amazon Resource Name (ARN) of the EKS Node Group."
}
output "id" {
  value       = aws_eks_node_group.main.id
  description = "EKS Cluster name and EKS Node Group name separated by a colon (:)."
}
output "resources" {
  value       = aws_eks_node_group.main.resources
  description = "List of objects containing information about underlying resources."
}
output "status" {
  value       = aws_eks_node_group.main.status
  description = "Status of the EKS Node Group."
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>