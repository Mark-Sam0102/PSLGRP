resource "aws_cloudwatch_log_metric_filter" "main" {

  name    = "${var.name_prefix}-route-table-changes"
  pattern = "{ ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) ||($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation)|| ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) ||($.eventName = DisassociateRouteTable) }"

  log_group_name = var.log_group_name

  metric_transformation {
    name      = "${var.name_prefix}RouteTableChangesCount"
    namespace = var.metric_namespace
    value     = "1"
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
