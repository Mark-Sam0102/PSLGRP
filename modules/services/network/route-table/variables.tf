
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
variable "name" {
  type        = string
  description = "Name used while applying tags to the resource"
}
# resource type = gateway_id | egress_only_gateway | nat_gateway
variable "routes" {
  type = list(object({
    address_space = string
    network_type  = string
    resource_id   = string
    resource_type = string
  }))
  description = "list of routes"
}
variable "subnets" {
  type        = list(string)
  description = "The subnet ID to create an association. "
  default     = []
}
