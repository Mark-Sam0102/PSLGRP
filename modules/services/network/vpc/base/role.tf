module "cloudwatch_log_publisher" {
  source = "../../../iam/policy/cloudwatch-log-publisher"

  context = var.context
  name    = var.name
}
module "vpc_flow_log_role" {
  source = "../../../iam/role/base"

  context           = var.context
  name              = var.name
  attached_policies = [module.cloudwatch_log_publisher.arn]
  principals = [
    {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  ]
}