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
  description = "Name of eks cluster"
  default     = "AWS-EKS"
}
variable "role_arn" {
  type        = string
  description = "Amazon Resource Name (ARN) specifying the role for eks_cluster"
}
variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs associated with the eks cluster. Must be in at least two different availability zones. "
  default     = []
}
variable "endpoint_private_access" {
  type        = bool
  description = "To enable the Amazon EKS private API server endpoint."
  default     = false
}
variable "endpoint_public_access" {
  type        = bool
  description = "To enable the Amazon EKS public API server endpoint."
  default     = true
}
variable "kubernetes_version" {
  type        = number
  description = "This is kubernetes version 1.26,1.25,1.24"
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
