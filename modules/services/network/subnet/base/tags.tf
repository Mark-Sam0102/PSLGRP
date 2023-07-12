locals {

  app_tag  = { "app" = var.context.application_name }
  env_tag  = { "env" = var.context.environment_name }
  name_tag = { "Name" = var.name }
  az_tag   = var.availability_zone == null ? null : { "az" = var.availability_zone }

  combined_tags = merge(local.name_tag, local.app_tag, local.env_tag, local.az_tag, var.context.tags)
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>