resource "aws_glacier_vault" "main" {
  name          = var.name
  access_policy = var.access_policy

  dynamic "notification" {
    for_each = var.notification == null ? [] : [1]

    content {
      events    = var.notification.events
      sns_topic = var.notification.sns_topic
    }
  }
  tags = local.combined_tags
}
