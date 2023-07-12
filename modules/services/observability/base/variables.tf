variable "context" {
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)

  })
  description = "The context object provides important details about the environment that this resource will be deployed into"
}
variable "retention_policy" {
  type = object({
    short_term = number
    long_term  = number
  })
  description = "Retains your configuration items for that specified period"
}
variable "name" {
  type        = string
  description = "Resource name"
}
variable "force_destroy" {
  type        = bool
  description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. WARNING: Setting this might cause loss of data"
  default     = false
}
variable "account_id" {
  type        = string
  description = "The account ID"
  default     = null
}
