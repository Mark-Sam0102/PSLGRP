resource "aws_cloudwatch_log_metric_filter" "main" {

  name           = "${var.name_prefix}-unauthorized-api-calls"
  pattern        = "{($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\")}"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "${var.name_prefix}UnauthorizedApiCallsCount"
    namespace = var.metric_namespace
    value     = "1"
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
