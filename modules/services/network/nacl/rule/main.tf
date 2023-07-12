resource "aws_network_acl_rule" "main" {
  network_acl_id  = var.network_acl_id
  rule_number     = var.rule_number
  egress          = var.type == "egress" ? true : false
  protocol        = var.protocol
  rule_action     = var.action
  cidr_block      = var.cidr_block
  ipv6_cidr_block = var.ipv6_cidr_block
  from_port       = var.from_port
  to_port         = var.to_port
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
