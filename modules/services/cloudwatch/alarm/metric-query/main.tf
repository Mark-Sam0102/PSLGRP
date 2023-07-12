resource "aws_cloudwatch_metric_alarm" "main" {
  alarm_name          = var.name
  alarm_description   = var.description
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  threshold           = var.threshold
  alarm_actions       = var.actions

  dynamic "metric_query" {
    for_each = var.metric_queries

    content {
      id          = metric_query.value.id
      expression  = metric_query.value.expression
      label       = metric_query.value.label
      return_data = metric_query.value.return_data

      dynamic "metric" {
        for_each = metric_query.value.metric == null ? [] : [metric_query.value.metric]
        
        content {
          metric_name = metric.value.name
          namespace   = metric.value.namespace
          period      = metric.value.period
          stat        = metric.value.stat
          unit        = metric.value.unit
          dimensions  = metric.value.dimensions

        }
      }
    }
  }

  tags = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
