resource "aws_iam_policy" "main" {

  name        = var.name
  path        = var.path
  description = var.description

  policy = data.aws_iam_policy_document.policy.json

  tags = local.combined_tags

}

data "aws_iam_policy_document" "policy" {
  statement {
    effect  = var.allow ? "Allow" : "Deny"
    actions = var.actions

    resources = var.resources

    dynamic "condition" {
      for_each = var.condition != null ? [1] : []
      content {
        test     = var.condition.test
        variable = var.condition.variable
        values   = var.condition.values
      }
    }
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
