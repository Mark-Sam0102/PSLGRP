
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
  description = "Name of the role."
}
variable "path" {
  type        = string
  default     = "/"
  description = "Path to the role."
}
variable "description" {
  type        = string
  default     = null
  description = "Description of the role."
}
# default is 1h | 3600s
variable "max_session_duration" {
  type        = number
  default     = 3600
  description = "Maximum session duration (in seconds) that you want to set for the specified role."
}
variable "attached_policies" {
  type        = list(string)
  default     = []
  description = "Policies that should be attached to the role"
}
variable "principals" {
  type = list(object({
    type        = string
    identifiers = list(string)
  }))
  description = "Specifies the principals who can use the role."
}
variable "conditions" {
  type = list(object({
    test     = string
    variable = string
    values   = list(string)
  }))
  description = "Constraints whether the role can be assumed in a particular situation."
  default     = []
}
variable "actions" {
  type        = list(string)
  description = "List of STS actions."
  default     = ["sts:AssumeRole"]
}
