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
  description = "The name of resource"
}
variable "path" {
  type        = string
  default     = "/"
  description = "Path in which to create the policy"
}
variable "description" {
  type        = string
  default     = null
  description = "Description of the IAM policy."
}
variable "secret_arn" {
  type        = string
  description = "ARNs of secret that this statement applies to."
}
variable "kms_key_arn" {
  type        = string
  description = "The KMS key used for the secret"
  default     = null
}
