resource "aws_globalaccelerator_accelerator" "main" {
  name            = var.name
  ip_address_type = var.ip_address_type
  enabled         = var.enabled

  attributes {
    flow_logs_enabled   = true
    flow_logs_s3_bucket = var.observability_settings.bucket.id
    flow_logs_s3_prefix = var.prefix
  }

  tags = local.combined_tags

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
