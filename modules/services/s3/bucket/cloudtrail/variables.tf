
variable "context" {
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)
  })
  description = "The context object provides important details about the environment that this resource will be deployed into"
}

variable "observability_settings" {
  type = object({

    log_group = object({
      name = string
      arn  = string
    })
    bucket = object({
      id  = string
      arn = string
    })
    cloudwatch_log_publisher_policy = object({
      arn = string
      id  = string
    })
    retention_policy = object({
      short_term = number
      long_term  = number
    })
  })
  description = "The observability settings object provides basic configuration that can be used to configure logging and monitoring within a module"
  default     = null
}

variable "name" {
  type        = string
  description = "The name of the bucket."
}

variable "force_destroy" {
  type        = bool
  description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. WARNING: Setting this might cause loss of data"
  default     = false
}

variable "ssl_requests_only" {
  type        = bool
  description = "To control whether insecure (HTTP) requests should be allowed or not"
  default     = true
}
variable "policy_documents" {
  type        = list(string)
  description = "List of IAM policy documents to be merged together and used for the S3 bucket policy"
  default     = []
}

variable "encryption_algorithm" {
  type        = string
  description = "The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms`"
  default     = "AES256"
}

variable "kms_key_id" {
  type        = string
  description = "The AWS KMS master key ID used for the SSE-KMS encryption."
  default     = null
}

variable "account_id" {
  type        = string
  description = "User Account ID"
}

variable "cloudtrail_name" {
  type        = string
  description = "Cloudtrail name."
}

variable "logging_prefix" {
  type        = string
  description = "To specify a key prefix for log objects. If no prefix is specified a default one is generated being `s3-access-logs/<bucket-name>/`"
  default     = null
}

variable "versioning" {
  type        = string
  description = "The versioning status of S3 bucket. Accepted values are: Enabled, Suspended, or Disabled"
  default     = "Disabled"
}
