
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
  description = "The name of the policy"
}
variable "path" {
  type        = string
  default     = "/"
  description = "Path in which to create the policy"
}
variable "description" {
  type        = string
  default     = null
  description = "Description of the IAM policy."
}
