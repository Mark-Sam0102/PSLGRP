resource "aws_cloudwatch_log_metric_filter" "main" {

  name    = "${var.name_prefix}-security-group-changes"
  pattern = "{ ($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup) }"

  log_group_name = var.log_group_name

  metric_transformation {
    name      = "${var.name_prefix}securityGroupChangesCount"
    namespace = var.metric_namespace
    value     = "1"
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
