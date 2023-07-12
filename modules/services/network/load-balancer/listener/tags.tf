locals {

  app_tag = { "app" = var.context.application_name }
  env_tag = { "env" = var.context.environment_name }

  combined_tags = merge(local.app_tag, local.env_tag, var.context.tags)
}
