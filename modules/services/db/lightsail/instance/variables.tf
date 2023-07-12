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
  description = "The name of the Lightsail Instance. "
}

variable "availability_zone" {
  type        = string
  description = "The Availability Zone in which to create your instance"
}

variable "blueprint_id" {
  type        = string
  description = "The ID for a virtual private server image"
}

variable "bundle_id" {
  type        = string
  description = "The bundle of specification information"
}

variable "key_pair_name" {
  type        = string
  description = "The name of your key pair"
  default     = null
}

variable "user_data" {
  type        = string
  description = "launch script to configure server with additional user data"
  default     = null
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>