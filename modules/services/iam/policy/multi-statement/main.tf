resource "aws_iam_policy" "main" {

  name        = var.name
  path        = var.path
  description = var.description

  policy = data.aws_iam_policy_document.policy.json

  tags = local.combined_tags

}

data "aws_iam_policy_document" "policy" {

  dynamic "statement" {
    for_each = var.statements

    content {
      actions   = statement.value.actions
      resources = statement.value.resources
      effect    = statement.value.allow ? "Allow" : "Deny"

      dynamic "condition" {
        for_each = statement.value.conditions

        content {
          test     = condition.value.test
          variable = condition.value.variable
          values   = condition.value.values
        }
      }
    }
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
