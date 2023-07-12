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
  description = "Name of the role."
}
variable "path" {
  type        = string
  description = "Path to the role."
  default     = "/"
}
variable "description" {
  type        = string
  description = "Description of the role."
  default     = "IAM Role for EKS Fargate Profile."
}
variable "max_session_duration" {
  type        = number
  description = "Maximum session duration (in seconds) that you want to set for the specified role."
  default     = 3600
}
variable "attached_policies" {
  type        = list(string)
  description = "List of ARN's attached to the role. Few policies are already attached."
  default     = []
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
