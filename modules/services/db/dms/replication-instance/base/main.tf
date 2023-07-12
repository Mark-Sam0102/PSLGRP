resource "aws_dms_replication_instance" "main" {
  replication_instance_class  = var.instance_class
  replication_instance_id     = var.name
  availability_zone           = var.availability_zone
  multi_az                    = var.multi_az
  replication_subnet_group_id = var.subnet_group_id
  vpc_security_group_ids      = var.security_group

  tags = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
