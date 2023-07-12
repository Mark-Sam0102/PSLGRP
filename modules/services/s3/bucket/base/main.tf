locals {
  logging_prefix = coalesce(var.logging_prefix, "s3-access-logs/${var.name}/")
}

resource "aws_s3_bucket" "main" {

  bucket        = var.name
  force_destroy = var.force_destroy

  tags = local.combined_tags

}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = var.versioning
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.main.id

  count = var.encryption_algorithm == null ? 0 : 1

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_id
      sse_algorithm     = var.encryption_algorithm
    }
    # Use S3 bucket keys to save cost with SSE-KMS
    bucket_key_enabled = var.encryption_algorithm == "aws:kms" ? true : false
  }
}

resource "aws_s3_bucket_logging" "bucket_logging" {
  bucket = aws_s3_bucket.main.id

  count = var.observability_settings == null ? 0 : 1

  target_bucket = var.observability_settings.bucket.id
  target_prefix = local.logging_prefix
}

resource "aws_s3_bucket_cors_configuration" "example" {
  bucket = aws_s3_bucket.main.id

  count = length(var.cors_rules) > 0 ? 1 : 0

  dynamic "cors_rule" {
    for_each = var.cors_rules
    content {
      allowed_headers = each.value.allowed_headers
      allowed_methods = each.value.allowed_methods
      allowed_origins = each.value.allowed_origins
      expose_headers  = each.value.expose_headers
      max_age_seconds = each.value.max_age_seconds
    }
  }
}

resource "aws_s3_bucket_request_payment_configuration" "request_payer" {
  bucket = aws_s3_bucket.main.id
  payer  = var.requester_pays == false ? "BucketOwner" : "Requester"
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.main.id

  # Conditional creation
  count = var.website == null ? 0 : 1

  index_document {
    suffix = var.website.index_document
  }
  error_document {
    key = var.website.error_document
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
