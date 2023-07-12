variable "bucket" {
  type = object({
    id  = string
    arn = string
  })
  description = "The S3 buckets details"
}

variable "topics" {
  type = list(object({
    id            = string
    arn           = string
    events        = list(string)
    filter_prefix = string
    filter_suffix = string
  }))
  description = "The notification configuration for SNS topic"
  default     = []
}
variable "queues" {
  type = list(object({
    id            = string
    arn           = string
    events        = list(string)
    filter_prefix = string
    filter_suffix = string
  }))
  description = "The notification configuration for SQS queues"
  default     = []
}
variable "lambda_functions" {
  type = list(object({
    id            = string
    arn           = string
    events        = list(string)
    filter_prefix = string
    filter_suffix = string
  }))
  description = "The notification configuration for Lambda functions"
  default     = []
}
