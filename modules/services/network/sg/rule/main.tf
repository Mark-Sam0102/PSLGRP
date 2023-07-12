resource "aws_security_group_rule" "main" {

  security_group_id = var.security_group_id

  description = var.description
  type        = var.type
  from_port   = var.from
  to_port     = var.to
  protocol    = var.protocol

  cidr_blocks      = var.network_type == "ip" ? var.address_space : null
  ipv6_cidr_blocks = var.network_type == "ipv6" ? var.address_space : null

  source_security_group_id = var.source_security_group_id

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
