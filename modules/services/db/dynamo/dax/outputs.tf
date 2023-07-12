output "arn" {
  value       = aws_dax_cluster.main.arn
  description = "The ARN of the DAX cluster"
}

output "nodes" {
  value       = aws_dax_cluster.main.nodes
  description = "List of node objects including id, address, port and availability_zone"
}

output "configuration_endpoint" {
  value       = aws_dax_cluster.main.configuration_endpoint
  description = "The configuration endpoint for this DAX cluster, consisting of a DNS name and a port number"
}

output "cluster_address" {
  value       = aws_dax_cluster.main.cluster_address
  description = "The DNS name of the DAX cluster without the port appended"
}

output "port" {
  value       = aws_dax_cluster.main.port
  description = "The port used by the configuration endpoint"
}

output "subnet_group_id" {
  value       = aws_dax_subnet_group.main.id
  description = "The name of the subnet group"
}

# © 2023 Persistent Systems, <cloud-automation-stack@persistent.com>

