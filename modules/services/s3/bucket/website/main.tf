module "public" {
  source = "../public"

  context                = var.context
  observability_settings = var.observability_settings

  name                 = var.name
  force_destroy        = var.force_destroy
  policy_documents     = var.policy_documents
  encryption_algorithm = var.encryption_algorithm
  kms_key_id           = var.kms_key_id

  # Amazon S3 website endpoints do not support HTTPS or access points.
  ssl_requests_only = false

  # Requester Pays buckets do not allow access through a website endpoint.
  requester_pays = false

  website = {
    index_document = var.index_document
    error_document = var.error_document
  }

  logging_prefix = var.logging_prefix
  versioning     = var.versioning
  cors_rules     = var.cors_rules
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
