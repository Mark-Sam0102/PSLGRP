variable "security_group_id" {
  type        = string
  description = "Security group to apply this rule to."
}
variable "description" {
  type        = string
  description = "Description of the rule."
}
# egress | ingress
variable "type" {
  type        = string
  description = "Type of rule being created. Valid options are ingress (inbound) or egress (outbound)"
}
variable "from" {
  type        = number
  description = "Start port"
}
variable "to" {
  type        = number
  description = "End port"
}
variable "protocol" {
  type        = string
  description = "Protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number"
}
variable "address_space" {
  type        = list(string)
  description = "address"
  default     = []
}
# ip | ipv6
variable "network_type" {
  type        = string
  description = "Type of network"
  default     = null
}
variable "source_security_group_id" {
  type        = string
  description = "Security group id to allow access to/from, depending on the type."
  default     = null
}