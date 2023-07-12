variable "context" {
  description = "The context object provides important details about the environment that this resource will be deployed into."
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)
  })
}

variable "name" {
  description = "The name of the policy"
  type = string
}

variable "path" {
  description = "The path of the policy"
  type = string
}

variable "description" {
  description = "The description of the policy"
  type = string
}

variable "account_id"{
  description = "Account ID for policies"
 type = string
}
