resource "aws_dms_event_subscription" "main" {
  name             = var.name
  event_categories = var.event_categories
  source_type      = var.source_type
  source_ids       = var.source_ids
  sns_topic_arn    = var.sns_topic_arn

  tags = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
