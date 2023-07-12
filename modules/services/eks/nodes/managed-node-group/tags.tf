locals {

  app_tag          = { "app" = var.context.application_name }
  env_tag          = { "env" = var.context.environment_name }
  name_tag         = { "Name" = var.name }
  cluster_label    = { "kubernetes.io/cluster/${var.cluster_name}" = "shared" }
  node_group_label = { "kubernetes.io/cluster/${var.cluster_name}" = "shared" }


  combined_tags = merge(local.name_tag, local.app_tag, local.env_tag, var.context.tags, local.cluster_label, local.node_group_label)

}
