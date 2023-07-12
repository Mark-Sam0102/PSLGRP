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
  description = "Name of the Site to site connection"
}
variable "type" {
  type        = string
  description = "Type of VPN connection"
  default     = "ipsec.1"
}

variable "customer_gateway_id" {
  type        = string
  description = "The ID of the customer gateway"
}

variable "vpn_gateway_id" {
  type        = string
  description = "ID of the Virtual Private Gateway"
  default     = null
}

variable "transit_gateway_id" {
  type        = string
  description = "ID of the EC2 Transit Gateway"
  default     = null
}

variable "tunnel1_inside_cidr" {
  type        = string
  description = "The CIDR block of the inside IP addresses for the first VPN tunnel"
  default     = null
}

variable "tunnel2_inside_cidr" {
  type        = string
  description = "The CIDR block of the inside IP addresses for the second VPN tunnel"
  default     = null
}
