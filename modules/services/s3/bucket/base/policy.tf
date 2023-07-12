locals {
  policy_documents = var.ssl_requests_only ? concat(var.policy_documents, [data.aws_iam_policy_document.ssl_only.json]) : var.policy_documents
  provision_policy = length(local.policy_documents) > 0
  provision_count  = local.provision_policy ? 1 : 0
}

resource "aws_s3_bucket_policy" "main" {

  count = local.provision_count

  bucket = aws_s3_bucket.main.id
  policy = data.aws_iam_policy_document.combined[0].json
}

data "aws_iam_policy_document" "combined" {

  count = local.provision_count

  source_policy_documents = local.policy_documents
}

data "aws_iam_policy_document" "ssl_only" {
  statement {
    actions = ["s3:*"]
    effect  = "Deny"
    resources = [
      aws_s3_bucket.main.arn,
      "${aws_s3_bucket.main.arn}/*"
    ]
    condition {
      test     = "Bool"
      values   = ["false"]
      variable = "aws:SecureTransport"
    }
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}
