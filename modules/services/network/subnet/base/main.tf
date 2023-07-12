resource "aws_subnet" "main" {

  vpc_id                  = var.vpc_id
  availability_zone       = var.availability_zone
  cidr_block              = var.address_space
  map_public_ip_on_launch = var.map_public_ip
  tags                    = local.combined_tags

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>