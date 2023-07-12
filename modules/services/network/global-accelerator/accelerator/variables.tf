variable "context" {
  type = object({

    application_name = string
    environment_name = string
    region           = string
    tags             = map(string)
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
  description = "The name of the accelerator"
}

variable "ip_address_type" {
  type        = string
  description = "The value for the address type"
  default     = "IPV4"
}

variable "enabled" {
  type        = bool
  description = "Indicates whether the accelerator is enabled"
  default     = true
}

variable "prefix" {
  type        = string
  description = "The prefix for the location in the Amazon S3 bucket for the flow logs"
  default     = "flow-logs/"
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>

