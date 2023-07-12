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
  description = "name of the target group"
}

variable "target_id" {
  type        = string
  description = " The ID of the target. This is the  arn of lambda function."
}