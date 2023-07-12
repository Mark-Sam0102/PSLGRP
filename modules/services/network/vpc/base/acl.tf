locals {
  default_ingress = [
    {
      protocol        = -1
      rule_no         = 100
      action          = "allow"
      cidr_block      = aws_vpc.main.cidr_block
      ipv6_cidr_block = null
      from_port       = 0
      to_port         = 0
    }
  ]
  default_egress = [
    {
      protocol        = -1
      rule_no         = 100
      action          = "allow"
      cidr_block      = "0.0.0.0/0"
      ipv6_cidr_block = null
      from_port       = 0
      to_port         = 0
    }
  ]

}
resource "aws_default_network_acl" "main" {
  default_network_acl_id = aws_vpc.main.default_network_acl_id

  dynamic "ingress" {
    for_each = var.ingress == null ? local.default_ingress : var.ingress
    content {
      protocol        = ingress.value.protocol
      rule_no         = ingress.value.rule_no
      action          = ingress.value.action
      cidr_block      = ingress.value.cidr_block
      ipv6_cidr_block = ingress.value.ipv6_cidr_block
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
    }
  }

  dynamic "egress" {
    for_each = var.egress == null ? local.default_egress : var.egress
    content {
      protocol        = egress.value.protocol
      rule_no         = egress.value.rule_no
      action          = egress.value.action
      cidr_block      = egress.value.cidr_block
      ipv6_cidr_block = egress.value.ipv6_cidr_block
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
    }
  }

  tags = local.combined_tags

  lifecycle {
    ignore_changes = [subnet_ids]
  }
}