resource "aws_nat_gateway" "main" {

  connectivity_type = var.connectivity_type
  subnet_id         = var.subnet_id
  allocation_id     = var.eip_id

  tags = local.combined_tags

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
