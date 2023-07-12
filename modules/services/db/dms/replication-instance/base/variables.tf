variable "context" {
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)
  })
  description = "The context object provides important details about the environment that this resource will be deployed into"
}

variable "instance_class" {
  type        = string
  description = "The compute and memory capacity of the replication instance."
}

variable "name" {
  type        = string
  description = "The replication instance identifier."
}

variable "subnet_group_id" {
  type        = string
  description = "Subnet group to associate with the replication instance."
  default     = null
}

variable "availability_zone" {
  type        = string
  description = "Availability zone where the replication instance will be created."
  default     = null
}

variable "multi_az" {
  type        = bool
  description = "weather the replication instance is a multi-az deployment or not."
  default     = false
}

variable "security_group" {
  type        = list(string)
  description = "A list of VPC security group IDs to be used with the replication instance."
  default     = null
}
