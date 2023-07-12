
resource "aws_route_table_association" "subnet_associations" {

  count = length(var.subnets)

  subnet_id      = var.subnets[count.index]
  route_table_id = aws_route_table.main.id

}
