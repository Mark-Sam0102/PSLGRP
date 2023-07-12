resource "aws_dms_replication_task" "main" {
  replication_task_id      = var.name
  migration_type           = var.migration_type
  replication_instance_arn = var.replication_instance_arn
  source_endpoint_arn      = var.source_endpoint_arn
  table_mappings           = var.table_mappings
  target_endpoint_arn      = var.target_endpoint_arn

  tags = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
