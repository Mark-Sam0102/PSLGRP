module "main" {

  source = "../private"

  context                = var.context
  observability_settings = var.observability_settings

  name                 = var.name
  force_destroy        = var.force_destroy
  ssl_requests_only    = var.ssl_requests_only
  policy_documents     = concat(var.policy_documents, [data.aws_iam_policy_document.cloudtrail_role_policy.json])
  encryption_algorithm = var.encryption_algorithm
  logging_prefix       = var.logging_prefix
  versioning           = var.versioning
  kms_key_id           = var.kms_key_id
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
