resource "aws_vpn_connection" "main" {
  type                = var.type
  customer_gateway_id = var.customer_gateway_id
  vpn_gateway_id      = var.vpn_gateway_id
  transit_gateway_id  = var.transit_gateway_id
  tunnel1_inside_cidr = var.tunnel1_inside_cidr
  tunnel2_inside_cidr = var.tunnel2_inside_cidr

  tags = local.combined_tags
}

module "metric_alarm" {

  source = "../../../../../../services/cloudwatch/alarm/base"

  context = var.context

  name                = "${var.name}-alarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "TunnelState"
  namespace           = "AWS/VPN"
  period              = 300
  statistic           = "Maximum"
  threshold           = 0.5
  dimensions = {
    VpnId = aws_vpn_connection.main.id
  }
}
