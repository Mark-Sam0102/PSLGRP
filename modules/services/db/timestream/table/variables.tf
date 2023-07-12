variable "context" {
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)
  })
  description = "The context object provides important details about the environment that this resource will be deployed into"
}

variable "database_name" {
  type        = string
  description = "The name of the Table database"
}

variable "name" {
  type        = string
  description = "The name of the Timestream table"
}

variable "magnetic_store_write_properties" {
  type = object({
    magnetic_store_writes  = bool
    rejected_data_location = optional(object({
      s3_configuration     = optional(object({
        name               = optional(string)
        encryption_option  = optional(string)
        kms_key_id         = optional(string)
        object_key_prefix  = optional(string)
      }))
    }))
  })
  description = "Contains properties to set on the table when enabling magnetic store writes. rejected_data_location and s3_configuration can be optional. Possible values for encryption_option in s3_configuration are SSE_KMS, SSE_S3 or null, kms_key_id represent KMS key arn for the customer s3 location when encrypting with a KMS managed key and object_key_prefix adds prefix to organize the data stored in S3 buckets"
  default     = null
}

variable "retention_properties" {
  type = object({
    magnetic_store_retention_period_in_days = number
    memory_store_retention_period_in_hours  = number
  })
  description = "The retention duration for the memory store and magnetic store"
  default     = null
}

# © 2023 Persistent Systems, <cloud-automation-stack@persistent.com>