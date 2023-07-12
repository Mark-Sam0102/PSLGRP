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
  description = ""
}

variable "vpc_id" {
  type        = string
  description = "ID of EC2 VPC."
}

variable "transit_gateway_id" {
  type        = string
  description = "ID of EC2 Transit Gateway."
}

variable "subnets" {
  type        = list(string)
  description = "ID of EC2 Subnets."
}

variable "appliance_mode_support" {
  type        = bool
  description = "If enabled, a traffic flow between a source and destination uses the same AZ for the VPC attachment for the lifetime of that flow."
  default     = false
}

variable "dns_support" {
  type        = bool
  description = "Whether DNS support is enabled."
  default     = true
}

variable "ipv6_support" {
  type        = bool
  description = "Whether IPv6 support is enabled."
  default     = false
}

variable "transit_gateway_default_route_table_association" {
  type        = bool
  description = "whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table."
  default     = true
}

variable "transit_gateway_default_route_table_propagation" {
  type        = bool
  description = "whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table."
  default     = true
}

variable "transit_gateway_route_table_id" {
  type        = string
  description = "Route table ID of transit gateway."
  default     = null
}
