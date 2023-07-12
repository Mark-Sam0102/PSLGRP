
variable "network_acl_id" {
  type = string
  description = "Id of the nacl to which the rule belongs to"
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
