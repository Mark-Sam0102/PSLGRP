output "id" {
  value       = module.network_lb.id
  description = "The id of the load balancer"
}
output "arn" {
  value       = module.network_lb.arn
  description = "The ARN of the load balancer"
}
output "dns_name" {
  value       = module.network_lb.dns_name
  description = "The DNS name of the load balancer."
}
output "zone_id" {
  value       = module.network_lb.zone_id
  description = "The canonical hosted zone ID of the load balancer"
}
output "arn_suffix" {
  value       = module.network_lb.arn_suffix
  description = "The ARN suffix for use with CloudWatch Metrics."
}
