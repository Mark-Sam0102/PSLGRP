
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
  description = "Name used while applying tags to the resource"
}
variable "description" {
  type        = string
  description = "Security group description."
}
variable "vpc_id" {
  type        = string
  description = "The VPC ID."
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
  description = "Configuration block for egress rules."
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
}
