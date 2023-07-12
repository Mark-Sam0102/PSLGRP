output "arn" {
  value       = aws_lb.load_balancer.arn
  description = "The ARN of the load balancer"
}

output "id" {
  value       = aws_lb.load_balancer.id
  description = "The id of the load balancer"
}

output "dns_name" {
  value       = aws_lb.load_balancer.dns_name
  description = "The DNS name of the load balancer."
}

output "zone_id" {
  value       = aws_lb.load_balancer.zone_id
  description = "The canonical hosted zone ID of the load balancer"
}

output "arn_suffix" {
  value       = aws_lb.load_balancer.arn_suffix
  description = "The ARN suffix for use with CloudWatch Metrics."
}
