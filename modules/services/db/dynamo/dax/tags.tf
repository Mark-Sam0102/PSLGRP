locals {

  app_tag  = { "app" = var.context.application_name }
  env_tag  = { "env" = var.context.environment_name }
  name_tag = { "Name" = var.name }

  combined_tags = merge(local.name_tag, local.app_tag, local.env_tag, var.context.tags)
}

# © 2023 Persistent Systems, <cloud-automation-stack@persistent.com>
