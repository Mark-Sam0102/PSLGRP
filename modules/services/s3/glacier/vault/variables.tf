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
  description = "Name of the Vault"
}

variable "access_policy" {
  type        = string
  description = "Policy document"
  default     = null
}

variable "notification" {
  type = object({
    events    = list(string)
    sns_topic = string
  })
  description = "Notifications for the Vault."
  default     = null
}
