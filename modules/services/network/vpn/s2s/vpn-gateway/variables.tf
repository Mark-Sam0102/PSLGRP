variable "context" {
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)
  })
  description = "The context object provides important details about the environment that this resource will be deployed into"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID to create in"
  default     = null
}

variable "amazon_side_asn" {
  type        = string
  description = "The Autonomous System Number (ASN) for the Amazon side of the gateway"
  default     = null
}

variable "availability_zone" {
  type        = string
  description = "The Availability Zone for the virtual private gateway"
  default     = null
}

variable "name" {
  type        = string
  description = "Name of the vpn gateway"
}
# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
