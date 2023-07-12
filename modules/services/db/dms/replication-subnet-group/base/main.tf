resource "aws_dms_replication_subnet_group" "main" {
  replication_subnet_group_description = var.description
  replication_subnet_group_id          = var.name
  subnet_ids                           = var.subnet_ids

  tags = local.combined_tags

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
