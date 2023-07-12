resource "aws_lb" "load_balancer" {
  name                             = var.name
  internal                         = var.internal
  load_balancer_type               = var.load_balancer_type
  security_groups                  = var.security_groups
  subnets                          = var.subnets
  enable_cross_zone_load_balancing = var.cross_zone_load_balancing

  access_logs {
    bucket  = var.observability_settings.bucket.id
    enabled = true
    prefix  = var.logging_prefix
  }

  tags = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
