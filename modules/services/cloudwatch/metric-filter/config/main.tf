resource "aws_cloudwatch_log_metric_filter" "main" {
  name           = "${var.name_prefix}-config"
  pattern        = "{($.eventSource = config.amazonaws.com) && (($.eventName=StopConfigurationRecorder)||($.eventName=DeleteDeliveryChannel)||($.eventName=PutDeliveryChannel)||($.eventName=PutConfigurationRecorder))}"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "${var.name_prefix}ConfigChangeCount"
    namespace = var.metric_namespace
    value     = 1
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
