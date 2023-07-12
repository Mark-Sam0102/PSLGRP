module "vpc_flow_log_role" {
  source = "../../../iam/role/base"

  context           = var.context
  name              = var.name
  attached_policies = [var.observability_settings.cloudwatch_log_publisher_policy.arn]
  principals = [
    {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  ]
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>