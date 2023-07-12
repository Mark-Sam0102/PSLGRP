resource "aws_lb_target_group" "main" {
  name        = var.name
  target_type = var.target_type

  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id

  dynamic "health_check" {
    for_each = var.health_check_path == null ? [] : [1]

    content {
      path     = var.health_check_path
      protocol = var.protocol
    }
  }

  tags = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
