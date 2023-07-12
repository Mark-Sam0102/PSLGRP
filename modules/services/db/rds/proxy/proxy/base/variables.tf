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
  description = "The identifier for the proxy"
}

variable "engine_family" {
  type        = string
  description = "The kinds of databases that the proxy can connect to"
}

variable "debug_logging" {
  type        = bool
  description = "Whether the proxy includes detailed information about SQL statements in its logs"
  default     = false
}

variable "require_tls" {
  type        = bool
  description = "A Boolean parameter that specifies whether Transport Layer Security (TLS) encryption is required for connections to the proxy"
  default     = true
}

variable "auth" {
  type = list(object({
    secret_arn  = string
    description = string
    iam_auth    = string
  }))
  description = "Configuration block(s) with authorization mechanisms to connect to the associated instances or clusters"
}

variable "role_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) of the IAM role that the proxy uses to access secrets in AWS Secrets Manager."
}

variable "security_groups" {
  type        = list(string)
  description = "One or more VPC security group IDs to associate with the new proxy"
}

variable "subnets" {
  type        = list(string)
  description = "One or more VPC subnet IDs to associate with the new proxy"
}
