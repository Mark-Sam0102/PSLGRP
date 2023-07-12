resource "aws_cloudwatch_log_metric_filter" "main" {
  name           = "${var.name_prefix}-cloudtrail-config"
  pattern        = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging)} "
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "${var.name_prefix}CloudTrailConfigChangeCount"
    namespace = var.metric_namespace
    value     = "1"
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
