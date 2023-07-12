module "main" {
  source = "../base"

  context                = var.context
  observability_settings = var.observability_settings
  name                   = var.name
  force_destroy          = var.force_destroy
  ssl_requests_only      = var.ssl_requests_only
  policy_documents       = var.policy_documents
  encryption_algorithm   = var.encryption_algorithm
  logging_prefix         = var.logging_prefix
  versioning             = var.versioning
  kms_key_id             = var.kms_key_id
  cors_rules             = var.cors_rules
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = module.main.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
