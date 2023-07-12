variable "network_acl_id" {
  type        = string
  description = "Id of the nacl to which the rule belongs to"
}

variable "rule_number" {
  type        = number
  description = "The rule number for the rule. Rules are processed in ascending order of rule numbers"
}

# Accepted values: egress, ingress
variable "type" {
  type        = string
  description = "Whether the rule is for ingress or egress traffic"
}

variable "protocol" {
  type        = string
  description = "The network protocol for which the rule applies to"
}

variable "action" {
  type        = string
  description = "Indicates whether to allow or deny the traffic that matches the rule. Accepted values: allow | deny"
}

variable "cidr_block" {
  type        = string
  default     = null
  description = "The network range to allow or deny, in CIDR notation"
}

variable "ipv6_cidr_block" {
  type        = string
  default     = null
  description = "The IPv6 CIDR block to allow or deny"
}

variable "from_port" {
  type        = number
  description = "The from port to match"
}

variable "to_port" {
  type        = number
  description = "The to port to match"
}
