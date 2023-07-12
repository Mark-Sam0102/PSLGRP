module "policy" {
  source = "../../../iam/policy/base"

  context = var.context

  name        = var.name
  path        = var.path
  description = var.description
  resources   = [for s in var.bucket_arns : "${s}/*"]
  actions     = ["s3:Get*", "s3:List*"]
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
