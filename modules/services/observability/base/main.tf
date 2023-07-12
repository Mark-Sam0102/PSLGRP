module "short_term" {
  source = "../../../services/cloudwatch/log-group"

  context           = var.context
  name              = var.name
  retention_in_days = var.retention_policy.short_term
}

module "long_term" {
  source = "../../../services/s3/bucket/base"

  context          = var.context
  name             = var.name
  force_destroy    = var.force_destroy
  policy_documents = [data.aws_iam_policy_document.s3.json]
}

module "cloudwatch_log_publisher_policy" {
  source = "../../../services/iam/policy/cloudwatch-log-publisher"

  context     = var.context
  name        = var.name
  description = "cloud watch log policy"
}

resource "aws_s3_bucket_lifecycle_configuration" "s3_lifecycle_config" {
  bucket = module.long_term.id

  rule {
    id     = var.name
    status = "Enabled"

    expiration {
      days = var.retention_policy.long_term
    }
  }
}

locals {
  result = {
    log_group = {
      name = module.short_term.name
      arn  = module.short_term.arn
    }
    bucket = {
      id  = module.long_term.id
      arn = module.long_term.arn
    }
    cloudwatch_log_publisher_policy = {
      arn = module.cloudwatch_log_publisher_policy.arn
      id  = module.cloudwatch_log_publisher_policy.id
    }
    retention_policy = var.retention_policy
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
