resource "aws_vpc_peering_connection" "main" {

  vpc_id        = var.vpc_id
  peer_vpc_id   = var.peer_vpc_id
  peer_region   = var.peer_region
  peer_owner_id = var.peer_owner_id

  tags = local.combined_tags

}

resource "aws_route" "main" {

  count = length(var.route_table_ids)

  route_table_id            = var.route_table_ids[count.index]
  destination_cidr_block    = var.peer_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.main.id
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
