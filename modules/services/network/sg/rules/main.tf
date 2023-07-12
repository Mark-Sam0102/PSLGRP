module "ingress_rules" {

  source = "../rule"

  count = length(var.ingress)

  security_group_id        = var.security_group_id
  type                     = "ingress"
  description              = var.ingress[count.index].description
  from                     = var.ingress[count.index].from
  to                       = var.ingress[count.index].to
  protocol                 = var.ingress[count.index].protocol
  address_space            = var.ingress[count.index].address_space
  network_type             = var.ingress[count.index].network_type
  source_security_group_id = var.ingress[count.index].security_group_id

}

module "egress_rules" {

  source = "../rule"

  count = length(var.egress)

  security_group_id        = var.security_group_id
  type                     = "egress"
  description              = var.egress[count.index].description
  from                     = var.egress[count.index].from
  to                       = var.egress[count.index].to
  protocol                 = var.egress[count.index].protocol
  address_space            = var.egress[count.index].address_space
  network_type             = var.egress[count.index].network_type
  source_security_group_id = var.egress[count.index].security_group_id

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
