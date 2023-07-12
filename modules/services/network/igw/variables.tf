
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
  description = "The VPC ID to create in. "
}
variable "name" {
  type        = string
  description = "Name used while applying tags to the resource"
}
