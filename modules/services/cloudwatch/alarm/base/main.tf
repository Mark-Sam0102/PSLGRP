resource "aws_cloudwatch_metric_alarm" "main" {
  alarm_name          = var.name
  alarm_description   = var.description
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  alarm_actions       = var.actions
  dimensions          = var.dimensions
  tags                = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
