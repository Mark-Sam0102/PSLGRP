resource "aws_cloudwatch_log_metric_filter" "main" {

  name           = "${var.name_prefix}-login-without-mfa"
  pattern        = "{($.eventName = \"ConsoleLogin\") && ($.additionalEventData.MFAUsed != \"Yes\") }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "${var.name_prefix}LoginWithoutMFACount"
    namespace = var.metric_namespace
    value     = "1"
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
