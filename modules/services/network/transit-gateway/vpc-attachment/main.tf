resource "aws_ec2_transit_gateway_vpc_attachment" "main" {
  vpc_id                                          = var.vpc_id
  subnet_ids                                      = var.subnets
  transit_gateway_id                              = var.transit_gateway_id
  appliance_mode_support                          = var.appliance_mode_support ? "enable" : "disable"
  dns_support                                     = var.dns_support ? "enable" : "disable"
  ipv6_support                                    = var.ipv6_support ? "enable" : "disable"
  transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation

  tags = local.combined_tags
}

resource "aws_ec2_transit_gateway_route_table_association" "main" {
  count = var.transit_gateway_route_table_id == null ? 0 : 1

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.main.id
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
