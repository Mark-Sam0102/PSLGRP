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
  description = "The ID of the requester VPC."
}
variable "peer_vpc_id" {
  type        = string
  description = "The ID of the VPC with which you are creating the VPC Peering Connection."
}
variable "route_table_ids" {
  type        = list(string)
  description = "IDs of route table."
}
variable "peer_vpc_cidr" {
  type        = string
  description = "accepter cidr"
}
variable "peer_region" {
  type        = string
  description = "The region of the accepter VPC of the VPC Peering Connection."
  default     = null
}
variable "peer_owner_id" {
  type        = string
  description = " The AWS account ID of the owner of the peer VPC."
  default     = null
}