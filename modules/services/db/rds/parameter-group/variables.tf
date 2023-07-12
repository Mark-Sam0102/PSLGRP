
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
  description = "Name used while applying tags to the resource"
}
variable "family" {
  type        = string
  description = "The family of the DB parameter group."
}
variable "parameters" {
  type        = map(string)
  description = "A list of DB parameters to apply."
}
