resource "aws_dax_cluster" "main" {
  cluster_name                     = var.name
  cluster_endpoint_encryption_type = var.endpoint_encryption_type
  iam_role_arn                     = var.role_arn
  node_type                        = var.node_type
  replication_factor               = var.replication_factor
  availability_zones               = var.availability_zones
  description                      = var.description
  notification_topic_arn           = var.sns_topic_arn
  parameter_group_name             = var.parameter_group_name
  maintenance_window               = var.maintenance_window
  security_group_ids               = var.security_group_ids
  subnet_group_name                = aws_dax_subnet_group.main.name

  server_side_encryption {
    enabled = var.server_side_encryption
  }
}

resource "aws_dax_subnet_group" "main" {
  name       = "subnet-group-${var.name}"
  subnet_ids = var.subnet_ids
}

# © 2023 Persistent Systems, <cloud-automation-stack@persistent.com>
