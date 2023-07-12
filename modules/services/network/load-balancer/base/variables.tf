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
}
variable "internal" {
  type        = bool
  default     = false
  description = "If true load balancer routes requests from clients to targets using private IP addresses"
}
variable "load_balancer_type" {
  type        = string
  description = "The type of load balancer. Available values are application , gateway and network"
}
variable "security_groups" {
  type        = list(string)
  default     = null
  description = "List of security group IDs for Load Balancer But security_groups only valid for application load balancer"
}
variable "subnets" {
  type        = list(string)
  description = "List of subnets IDs for Load Balancer"
}
variable "name" {
  type        = string
  description = "name of load balancer"
}
variable "cross_zone_load_balancing" {
  type        = bool
  description = "To enable cross-zone load balancing. Only valid for Network load balancer"
  default     = false
}
variable "logging_prefix" {
  type        = string
  description = "The S3 bucket prefix. Logs are stored in the root if not configured."
  default     = null
}
