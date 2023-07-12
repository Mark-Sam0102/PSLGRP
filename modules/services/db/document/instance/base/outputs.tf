output "id" {
  value       = aws_docdb_cluster_instance.main.id
  description = "ID of the resource"
}
output "arn" {
  value       = aws_docdb_cluster_instance.main.arn
  description = "The Amazon Resource Name (ARN) of resource"
}
