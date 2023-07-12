resource "aws_cloudwatch_log_metric_filter" "main" {
  name           = "${var.name_prefix}-console-auth-failures"
  pattern        = "{($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\") } "
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "${var.name_prefix}ConsoleAuthFailureCount"
    namespace = var.metric_namespace
    value     = 1
  }

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
