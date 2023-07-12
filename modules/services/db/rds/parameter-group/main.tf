resource "aws_db_parameter_group" "main" {

  name        = var.name
  family      = var.family
  description = "${var.name} Parameter Group"

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name  = parameter.key
      value = parameter.value
    }
  }

  tags = local.combined_tags

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
