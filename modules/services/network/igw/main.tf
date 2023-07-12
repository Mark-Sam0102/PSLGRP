resource "aws_internet_gateway" "main" {

  vpc_id = var.vpc_id

  tags = local.combined_tags

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
