resource "aws_cloudwatch_log_metric_filter" "main" {
  name           = "${var.name_prefix}-network-gateway-changes"
  pattern        = "{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "${var.name_prefix}NetworkGatewayChangeCount"
    namespace = var.metric_namespace
    value     = "1"
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
