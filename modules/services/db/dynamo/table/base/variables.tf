variable "context" {
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)
  })
  description = "The context object provides important details about the environment that this resource will be deployed into"
}

variable "name" {
  type        = string
  description = "The name of the DynamoDB table. Needs to be unique within a region."
}

variable "billing_mode" {
  type        = string
  description = "Controls how you are charged for read and write throughput and how you manage capacity. valid values are 'PROVISIONED' and 'PAY_PER_REQUEST'."
  default     = "PAY_PER_REQUEST"
}

variable "read_capacity" {
  type        = number
  description = "The number of read units for this table. Required if 'billing_mode' is 'PROVISIONED'"
  default     = null
}

variable "write_capacity" {
  type        = number
  description = "The number of write units for this table. Required if 'billing_mode' is 'PROVISIONED'"
  default     = null
}

variable "stream_view_type" {
  type        = string
  description = "Setting this enables streams and determines the information written to it. Valid values are 'KEYS_ONLY', 'NEW_IMAGE', 'OLD_IMAGE', 'NEW_AND_OLD_IMAGES'."
  default     = null
}

variable "hash_key" {
  type        = string
  description = "The attribute to use as the hash (partition) key."
}

variable "range_key" {
  type        = string
  description = "The attribute to use as the range (sort) key."
}

variable "attributes" {
  type = list(object({
    name = string
    type = string
  }))
  description = "List of attribute definitions. Type must be a scalar type: 'S', 'N', or 'B' for (S)tring, (N)umber or (B)inary data"
}

variable "replicas" {
  type        = list(string)
  description = "A list of region names for replicas."
  default     = []
}

variable "encryption" {
  type        = bool
  description = "Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK)."
  default     = false
}

variable "kms_key" {
  type        = string
  description = "The ARN of the CMK that should be used for the AWS KMS encryption."
  default     = null
}

variable "global_secondary_indices" {
  type = list(object({
    name               = string
    write_capacity     = number
    read_capacity      = number
    hash_key           = string
    range_key          = string
    projection_type    = string
    non_key_attributes = list(string)
  }))
  description = "Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc."
  default     = []
}

variable "point_in_time_recovery" {
  type        = bool
  description = "Whether to enable point-in-time recovery"
  default     = false
}
