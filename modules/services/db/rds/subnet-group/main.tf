resource "aws_db_subnet_group" "main" {

  name       = "${var.name}-snets"
  subnet_ids = var.subnets

  tags = local.combined_tags

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
