resource "aws_network_interface" "main" {

  subnet_id       = var.subnet_id
  private_ips     = var.private_ips
  security_groups = var.security_groups

  tags = local.combined_tags

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
