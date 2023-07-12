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
  description = "Transit Gateway name."
}

variable "description" {
  type        = string
  description = "Description of the EC2 Transit Gateway."
  default     = null
}

variable "amazon_side_asn" {
  type        = number
  description = "Private Autonomous System Number (ASN) for the Amazon side of a BGP session.The range is 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs."
  default     = null
}

variable "default_route_table_association" {
  type        = bool
  description = "Determine if resource attachments will automatically associated with the default association route table or not."
  default     = true
}

variable "default_route_table_propagation" {
  type        = bool
  description = "Determine if resource attachments automatically propagate routes to the default propagation route table or not."
  default     = true
}

variable "dns_support" {
  type        = bool
  description = "DNS support is enabled or not."
  default     = true
}

variable "vpn_ecmp_support" {
  type        = bool
  description = "VPN Equal Cost Multipath Protocol support is enabled or not."
  default     = true
}
