resource "aws_route_table" "main" {
  vpc_id = var.vpc_id
  tags   = local.combined_tags
}

# need to provision the routes this way so we can add more later using the Route Table ID
# tflint-ignore: aws_route_specified_multiple_targets
resource "aws_route" "main" {

  count = length(var.routes)

  route_table_id = aws_route_table.main.id

  destination_cidr_block      = var.routes[count.index].network_type == "ip" ? var.routes[count.index].address_space : null
  destination_ipv6_cidr_block = var.routes[count.index].network_type == "ipv6" ? var.routes[count.index].address_space : null

  egress_only_gateway_id = var.routes[count.index].resource_type == "egress_only_gateway" ? var.routes[count.index].resource_id : null
  gateway_id             = var.routes[count.index].resource_type == "gateway" ? var.routes[count.index].resource_id : null
  nat_gateway_id         = var.routes[count.index].resource_type == "nat_gateway" ? var.routes[count.index].resource_id : null
  local_gateway_id       = var.routes[count.index].resource_type == "local_gateway" ? var.routes[count.index].resource_id : null
  network_interface_id   = var.routes[count.index].resource_type == "network_interface" ? var.routes[count.index].resource_id : null
  transit_gateway_id     = var.routes[count.index].resource_type == "transit_gateway" ? var.routes[count.index].resource_id : null
  vpc_endpoint_id        = var.routes[count.index].resource_type == "vpc_endpoint" ? var.routes[count.index].resource_id : null

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
