module "network_lb" {
  source = "../base"

  name                   = var.name
  context                = var.context
  observability_settings = var.observability_settings

  internal                  = var.internal
  load_balancer_type        = "network"
  subnets                   = var.subnets
  cross_zone_load_balancing = var.cross_zone_load_balancing
  logging_prefix            = var.logging_prefix
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
