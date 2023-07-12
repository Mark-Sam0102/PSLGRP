output "arn" {
  value       = aws_ec2_transit_gateway.main.arn
  description = "EC2 Transit Gateway ARN."
}

output "id" {
  value       = aws_ec2_transit_gateway.main.id
  description = "EC2 Transit Gateway ID."
}

output "association_default_route_table_id" {
  value       = aws_ec2_transit_gateway.main.association_default_route_table_id
  description = "ID of the default association route table."
}

output "propagation_default_route_table_id" {
  value       = aws_ec2_transit_gateway.main.propagation_default_route_table_id
  description = "ID of the default propagation route table."
}
