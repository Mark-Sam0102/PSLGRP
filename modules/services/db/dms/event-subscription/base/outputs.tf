output "arn" {
  value = aws_dms_event_subscription.main.arn
  description = "The ARN of event subscription."
}