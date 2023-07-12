resource "aws_vpc" "main" {

  cidr_block           = var.address_space
  enable_dns_hostnames = var.dns_hostnames
  enable_dns_support   = var.dns_support

  tags = local.combined_tags

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
