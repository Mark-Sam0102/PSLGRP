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
  description = "Name of event subscription."
}

variable "source_ids" {
  type        = list(string)
  description = "IDs of replication instance or replication task."
}

variable "sns_topic_arn" {
  type        = string
  description = "ARN of SNS topic."
}

variable "event_categories" {
  type        = list(string)
  description = "List of event categories to listen.\n If event_type is replication-instance: [creation, failure,low storage,configuration change,maintenance,deletion,failover] \n If event_type is replication-task : [creation, failure,state change,configuration change,deletion]"
  default     = null
}

variable "source_type" {
  type        = string
  description = "Type of source for events. Valid values: replication-instance or replication-task"
  default     = null
}
