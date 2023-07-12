module "ingress_rules" {

  source = "../rule"

  count = length(var.ingress)

  network_acl_id = var.network_acl_id

  rule_number     = var.ingress[count.index].rule_no
  type            = "ingress"
  protocol        = var.ingress[count.index].protocol
  action          = var.ingress[count.index].action
  cidr_block      = var.ingress[count.index].cidr_block
  ipv6_cidr_block = var.ingress[count.index].ipv6_cidr_block
  from_port       = var.ingress[count.index].from_port
  to_port         = var.ingress[count.index].to_port

}

module "egress_rules" {

  source = "../rule"

  count = length(var.egress)

  network_acl_id = var.network_acl_id

  rule_number     = var.egress[count.index].rule_no
  type            = "egress"
  protocol        = var.egress[count.index].protocol
  action          = var.egress[count.index].action
  cidr_block      = var.egress[count.index].cidr_block
  ipv6_cidr_block = var.egress[count.index].ipv6_cidr_block
  from_port       = var.egress[count.index].from_port
  to_port         = var.egress[count.index].to_port

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
