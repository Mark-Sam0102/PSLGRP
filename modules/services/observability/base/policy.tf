data "aws_caller_identity" "current" {}

locals {
  account_id = var.account_id == null ? data.aws_caller_identity.current.account_id : var.account_id
}

data "aws_elb_service_account" "main" {
  region = var.context.region
}

# Amazon S3 bucket permissions for flow logs
# https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs-s3.html#flow-logs-s3-permissions
# For ELB access logs
# https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-access-logs.html#access-logging-bucket-permissions
# For S3 access logs
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/enable-server-access-logging.html
# For Redshift logs
# https://docs.aws.amazon.com/redshift/latest/mgmt/db-auditing.html#db-auditing-manage-log-files
data "aws_iam_policy_document" "s3" {
  statement {
    sid     = "AWSLogDeliveryWrite"
    effect  = "Allow"
    actions = ["s3:PutObject"]
    # We don't use the buckets ARN outputted by the module to avoid dependency cycles
    resources = ["arn:aws:s3:::${var.name}/*/AWSLogs/${local.account_id}/*"]

    principals {
      identifiers = ["delivery.logs.amazonaws.com"]
      type        = "Service"
    }
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [local.account_id]
    }
    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = ["arn:aws:logs:${var.context.region}:${local.account_id}:*"]
    }
  }

  statement {
    sid     = "AWSLogDeliveryCheck"
    effect  = "Allow"
    actions = ["s3:GetBucketAcl", "s3:ListBucket"]
    # We don't use the buckets ARN outputted by the module to avoid dependency cycles
    resources = ["arn:aws:s3:::${var.name}"]

    principals {
      identifiers = ["delivery.logs.amazonaws.com"]
      type        = "Service"
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [local.account_id]
    }
    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = ["arn:aws:logs:${var.context.region}:${local.account_id}:*"]
    }
  }

  statement {
    sid    = "ELBAccessLogs"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = [data.aws_elb_service_account.main.arn]
    }
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${var.name}/AWSLogs/${local.account_id}/*"]
  }

  statement {
    sid       = "S3ServerAccessLogsPolicy"
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${var.name}/*"]

    principals {
      type        = "Service"
      identifiers = ["logging.s3.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [local.account_id]
    }
  }

  statement {
    sid    = "RedshiftAuditLogs"
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetBucketAcl"
    ]
    resources = [
      "arn:aws:s3:::${var.name}",
      "arn:aws:s3:::${var.name}/*"
    ]

    principals {
      type        = "Service"
      identifiers = ["redshift.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [local.account_id]
    }
  }
}