variable "context" {
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)
  })
  description = "The context object provides important details about the environment that this resource will be deployed into"
}
variable "vpc_peering_connection_id" {
  type        = string
  description = "The VPC Peering Connection ID to manage."
}
variable "route_table_ids" {
  type        = list(string)
  description = "The IDs of the route tables in the accepter VPC where routes should be created"
}
variable "peer_vpc_cidr" {
  type        = string
  description = "CIDR block in the Peer VPC to which routes should be created"
}
