resource "aws_vpn_gateway" "main" {
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  amazon_side_asn   = var.amazon_side_asn
  tags              = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
