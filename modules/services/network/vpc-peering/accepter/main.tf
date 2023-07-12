resource "aws_vpc_peering_connection_accepter" "main" {
  vpc_peering_connection_id = var.vpc_peering_connection_id
  auto_accept               = true

  tags = local.combined_tags
}

resource "aws_route" "main" {
  count = length(var.route_table_ids)

  route_table_id            = var.route_table_ids[count.index]
  destination_cidr_block    = var.peer_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.main.vpc_peering_connection_id
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
