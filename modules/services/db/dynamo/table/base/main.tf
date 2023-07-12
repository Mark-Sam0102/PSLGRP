resource "aws_dynamodb_table" "main" {
  name = var.name

  hash_key  = var.hash_key
  range_key = var.range_key

  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  point_in_time_recovery {
    enabled = var.point_in_time_recovery
  }
  stream_enabled   = var.stream_view_type == null ? false : true
  stream_view_type = var.stream_view_type

  dynamic "attribute" {
    for_each = var.attributes

    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  server_side_encryption {
    enabled     = var.encryption
    kms_key_arn = var.kms_key
  }

  dynamic "replica" {
    for_each = var.replicas

    content {
      region_name = replica.value
    }
  }

  dynamic "global_secondary_index" {
    for_each = var.global_secondary_indices

    content {
      name               = global_secondary_index.value.name
      write_capacity     = global_secondary_index.value.write_capacity
      read_capacity      = global_secondary_index.value.read_capacity
      hash_key           = global_secondary_index.value.hash_key
      range_key          = global_secondary_index.value.range_key
      projection_type    = global_secondary_index.value.projection_type
      non_key_attributes = global_secondary_index.value.non_key_attributes
    }
  }

  tags = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
