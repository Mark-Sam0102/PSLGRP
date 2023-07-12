data "aws_s3_bucket" "main" {
  bucket = var.name
}

data "aws_cloudwatch_log_group" "main" {
  name = var.name
}

data "aws_iam_policy" "main" {
  name = var.name
}

locals {
  result = {
    log_group = {
      name = data.aws_cloudwatch_log_group.main.name
      arn  = data.aws_cloudwatch_log_group.main.arn
    }
    bucket = {
      id  = data.aws_s3_bucket.main.id
      arn = data.aws_s3_bucket.main.arn
    }
    cloudwatch_log_publisher_policy = {
      arn = data.aws_iam_policy.main.arn
      id  = data.aws_iam_policy.main.id
    }
    retention_policy = var.retention_policy
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
