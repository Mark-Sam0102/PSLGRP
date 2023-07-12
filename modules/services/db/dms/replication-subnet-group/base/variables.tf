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
  description = "The name for the replication subnet group. This value is stored as a lowercase string."
}

variable "description" {
  type        = string
  description = "The description for the subnet group."
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of the EC2 subnet IDs for the subnet group."
}