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
  description = "resource name"
}
variable "address_space" {
  type        = string
  description = "The CIDR block for the VPC."
}
variable "dns_hostnames" {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
  default     = false
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
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>