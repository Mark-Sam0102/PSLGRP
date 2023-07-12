# module "observability_stack" {
#   source = "../modules/services/observability/base"

#   context = local.primary_context
#   name    = "${local.deployment_id}-observability-stack"

#   # NOTE: Setting this can cause loss of data.
#   # This allows terraform to delete the bucket even if it has data in it
#   force_destroy = true

#   retention_policy = {
#     short_term = 90
#     long_term  = 365
#   }
# }
