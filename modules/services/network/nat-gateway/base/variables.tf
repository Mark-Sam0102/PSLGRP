variable "context" {
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)
  })
  description = "The context object provides important details about the environment that this resource will be deployed into"
}
variable "subnet_id" {
  type        = string
  description = "The Subnet ID of the subnet in which to place the gateway."
}
variable "name" {
  type        = string
  description = "Name used while applying tags to the resource"
}
# public | private
variable "connectivity_type" {
  type        = string
  description = "Connectivity type for the gateway. Valid values are private and public. Defaults to public."
  default     = "public"
}
variable "eip_id" {
  type        = string
  description = "The Allocation ID of the Elastic IP address for the gateway. Required for connectivity_type of public."
  default     = null
}
