module "main" {
  source = "../base"

  context                = var.context
  observability_settings = var.observability_settings

  name                 = var.name
  force_destroy        = var.force_destroy
  ssl_requests_only    = var.ssl_requests_only
  policy_documents     = concat(var.policy_documents, [data.aws_iam_policy_document.public.json])
  encryption_algorithm = var.encryption_algorithm
  kms_key_id           = var.kms_key_id
  requester_pays       = var.requester_pays
  cors_rules           = var.cors_rules
  website              = var.website
  logging_prefix       = var.logging_prefix
  versioning           = var.versioning
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
