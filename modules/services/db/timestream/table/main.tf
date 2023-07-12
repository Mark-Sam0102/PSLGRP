resource "aws_timestreamwrite_table" "main" {
  database_name = var.database_name
  table_name    = var.name

  dynamic "magnetic_store_write_properties" {
    for_each = var.magnetic_store_write_properties == null ? [] : [1]

    content {
      enable_magnetic_store_writes = var.magnetic_store_write_properties.magnetic_store_writes

      dynamic "magnetic_store_rejected_data_location" {
        for_each = var.magnetic_store_write_properties.rejected_data_location == null ? [] : [1]

        content {
          dynamic "s3_configuration" {
            for_each = var.magnetic_store_write_properties.rejected_data_location.s3_configuration == null ? [] : [var.magnetic_store_write_properties.rejected_data_location.s3_configuration]

            content {
              bucket_name       = s3_configuration.value.name
              encryption_option = s3_configuration.value.encryption_option
              kms_key_id        = s3_configuration.value.kms_key_id
              object_key_prefix = s3_configuration.value.object_key_prefix
            }
          }
        }
      }
    }
  }

  dynamic "retention_properties" {
    for_each = var.retention_properties == null ? [] : [1]

    content {
      magnetic_store_retention_period_in_days = var.retention_properties.magnetic_store_retention_period_in_days
      memory_store_retention_period_in_hours  = var.retention_properties.memory_store_retention_period_in_hours
    }
  }
  tags = local.combined_tags
}

# © 2023 Persistent Systems, <cloud-automation-stack@persistent.com>