resource "aws_eks_node_group" "main" {
  cluster_name = var.cluster_name

  node_group_name = var.name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnets
  instance_types = [var.instance_type]
  disk_size = var.disk_size
  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
  capacity_type = var.capacity_type
  tags = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
