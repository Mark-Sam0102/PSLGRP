
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
variable "actions" {
  type        = list(string)
  default     = []
  description = "List of actions to allow or deny."
}
variable "allow" {
  type        = bool
  description = "Whether this statement allows or denies the given actions."
  default     = true
}
variable "resources" {
  type        = list(string)
  default     = []
  description = "List of resource ARNs that this statement applies to."
}
variable "condition" {
  type = object({
    test     = string
    variable = string
    values   = list(string)
  })
  default     = null
  description = "Constrains whether a statement applies in a particular situation."
}
