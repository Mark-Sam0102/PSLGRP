resource "aws_iam_role" "main" {

  name                 = var.name
  path                 = var.path
  description          = var.description
  max_session_duration = var.max_session_duration
  assume_role_policy   = data.aws_iam_policy_document.assume_role_policy.json

  tags = local.combined_tags

}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {

    actions = var.actions

    dynamic "principals" {
      for_each = var.principals

      content {
        type        = principals.value.type
        identifiers = principals.value.identifiers
      }
    }

    dynamic "condition" {
      for_each = var.conditions

      content {
        test     = condition.value.test
        variable = condition.value.variable
        values   = condition.value.values
      }
    }

  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
