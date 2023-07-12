module "main" {
  source = "../base"

  context = var.context
  name    = var.name

  target_type = "ip"

  port       = var.port
  protocol   = var.protocol
  vpc_id     = var.vpc_id
  target_ids = []

  health_check_path = var.health_check_path
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
