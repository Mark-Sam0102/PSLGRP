variable "context" {
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)
  })
  description = "The context object provides important details about the environment that this resource will be deployed into"
}

variable "device_name" {
  type        = string
  description = "A name for the customer gateway device"
  default     = null
}

variable "type" {
  type        = string
  description = "The type of customer gateway"
  default     = "ipsec.1"
}

variable "bgp_asn" {
  type        = number
  description = "The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN)"
}

variable "certificate_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) for the customer gateway certificate"
  default     = null
}

variable "ip_address" {
  type        = string
  description = "The IPv4 address for the customer gateway device's outside interface"
}

variable "name" {
  type        = string
  description = "Name of the customer gateway"
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
