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

variable "metric_name" {
  type        = string
  description = "The name for the alarm's associated metric."
}

variable "namespace" {
  type        = string
  description = "The namespace for the alarm's associated metric."
}

variable "period" {
  type        = number
  description = "The period in seconds over which the specified statistic is applied."
}

variable "dimensions" {
  type        = map(string)
  description = "The dimensions for the alarm's associated metric"
  default     = null
}
variable "statistic" {
  type        = string
  description = "The statistic to apply to the alarm's associated metric. Valid are: SampleCount, Average, Sum, Minimum, Maximum"
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
