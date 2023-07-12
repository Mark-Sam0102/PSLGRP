
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
  description = "The VPC ID."
}
variable "availability_zone" {
  type        = string
  description = "The AZ for the subnet."
  default     = null
}
variable "name" {
  type        = string
  description = "The name to be used for provisioned resources"
}
variable "address_space" {
  type        = string
  description = "The CIDR block for the subnet."
}
variable "igw_id" {
  type        = string
  description = "The Internet Gateway ID"
}
variable "routes" {
  type = list(object({
    address_space = string
    network_type  = string
    resource_id   = string
    resource_type = string
  }))
  default = []
}
variable "map_public_ip" {
  type        = bool
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
  default     = false
}