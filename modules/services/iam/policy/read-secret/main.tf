data "aws_iam_policy_document" "main" {
  statement {
    actions = [
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds",
    ]
    resources = [
      var.secret_arn,
    ]
  }

  statement {
    actions = [
      "secretsmanager:ListSecrets",
    ]
    resources = [
      "*",
    ]
  }

  dynamic "statement" {
    for_each = var.kms_key_arn == null ? [] : [1]

    content {
      actions = [
        "kms:Decrypt"
      ]
      resources = [
        var.kms_key_arn
      ]
    }
  }
}

resource "aws_iam_policy" "main" {
  name        = var.name
  path        = var.path
  description = var.description
  policy      = data.aws_iam_policy_document.main.json

  tags = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
