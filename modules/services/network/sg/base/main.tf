resource "aws_security_group" "main" {

  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
  tags        = local.combined_tags

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
