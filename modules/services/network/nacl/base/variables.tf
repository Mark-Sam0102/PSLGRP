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

variable "vpc_id" {
  type        = string
  description = "Id of the vpc that the nacl will belong to"
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
  description = "Set of subnet ids that the nacl will be applied to"
}

variable "ingress" {
  type = list(object({
    protocol        = string
    rule_no         = number
    action          = string
    cidr_block      = string
    ipv6_cidr_block = string
    from_port       = number
    to_port         = number
  }))

  description = "An ingress rule specifying required details to restrict/allow inbound traffic"
}

variable "egress" {
  type = list(object({
    protocol        = string
    rule_no         = number
    action          = string
    cidr_block      = string
    ipv6_cidr_block = string
    from_port       = number
    to_port         = number
  }))

  description = "An egress rule specifying required details to restrict/allow outbound traffic"
}
