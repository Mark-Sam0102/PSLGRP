module "application_lb" {
  source = "../base"

  name                   = var.name
  context                = var.context
  observability_settings = var.observability_settings

  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets
  logging_prefix     = var.logging_prefix
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
