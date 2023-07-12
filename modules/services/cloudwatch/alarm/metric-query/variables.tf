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
  description = "Name of the alarm."
}

variable "description" {
  type        = string
  description = "Description of the alarm."
  default     = null
}

variable "comparison_operator" {
  type        = string
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold."
}

variable "evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "threshold" {
  type        = number
  description = "The value against which the specified statistic is compared."
}

variable "actions" {
  type        = list(string)
  description = "The list of actions ARN to execute when this alarm transitions into an ALARM state from any other state."
  default     = null
}

variable "metric_queries" {
  type = list(object({
    id          = string
    expression  = string
    label       = string
    return_data = string

    metric = object({
      name        = string
      namespace   = string
      period      = string
      stat        = string
      unit        = string
      dimensions  = map(string)

    })
  }))
  description = "Enables you to create an alarm based on a metric math expression"
  default     = []
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
