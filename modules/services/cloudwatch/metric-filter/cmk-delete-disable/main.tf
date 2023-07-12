resource "aws_cloudwatch_log_metric_filter" "main" {

  name    = "${var.name_prefix}-cmk-delete-disable"
  pattern = "{($.eventSource = kms.amazonaws.com) && (($.eventName=DisableKey)||($.eventName=ScheduleKeyDeletion)) }"

  log_group_name = var.log_group_name

  metric_transformation {
    name      = "${var.name_prefix}CMKDeletionDisableCount"
    namespace = var.metric_namespace
    value     = "1"
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
