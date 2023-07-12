data "aws_iam_policy_document" "public" {

  statement {
    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:ListBucket",
      "s3:ListBucketVersions",
    ]
    resources = [
      "arn:aws:s3:::${var.name}/*",
      "arn:aws:s3:::${var.name}"
    ]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}