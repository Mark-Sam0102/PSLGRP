
variable "context" {
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)
  })
}

variable "availability_zone" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "igw_id" {
  type = string
}
variable "public_address_space" {
  type = string
}
variable "private_address_space" {
  type = string
}
variable "public_routes" {
  type = list(object({
    address_space = string
    network_type  = string
    resource_id   = string
    resource_type = string
  }))
  default = []
}
variable "private_routes" {
  type = list(object({
    address_space = string
    network_type  = string
    resource_id   = string
    resource_type = string
  }))
  default = []
}
