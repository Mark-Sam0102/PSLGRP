
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
  description = "The name to use for the ENI"
}
variable "subnet_id" {
  type        = string
  description = "Subnet ID to create the ENI in."
}
variable "private_ips" {
  type        = list(string)
  description = "List of private IPs to assign to the ENI."
  default     = null
}
variable "security_groups" {
  type        = list(string)
  description = "List of security group IDs to assign to the ENI."
  default     = null
}
