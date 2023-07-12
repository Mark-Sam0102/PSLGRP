
variable "context" {
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)
  })
  description = "The context object provides important details about the environment that this resource will be deployed into"
}

variable "security_group_id" {
  type        = string
  description = "Security group to apply this rule to."
}
variable "ingress" {
  type = list(object({
    description       = string
    from              = number
    to                = number
    protocol          = string
    address_space     = list(string)
    network_type      = string
    security_group_id = string
  }))
  description = "Configuration block for ingress rules."
  default     = null
}
variable "egress" {
  type = list(object({
    description       = string
    from              = number
    to                = number
    protocol          = string
    address_space     = list(string)
    network_type      = string
    security_group_id = string
  }))
  description = "Configuration block for egress rules."
  default     = null
}
