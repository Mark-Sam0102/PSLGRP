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
  description = "Group identifier"
}

variable "endpoint_encryption_type" {
  type        = string
  description = "The type of encryption the cluster's endpoint should support"
  default     = "TLS"
}

variable "role_arn" {
  type        = string
  description = "A valid Amazon Resource Name (ARN) that identifies an IAM role"
}

variable "node_type" {
  type        = string
  description = "The compute and memory capacity of the nodes"
}

variable "replication_factor" {
  type        = number
  description = "The number of nodes in the DAX cluster"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones in which the nodes will be created"
  default     = null
}

variable "description" {
  type        = string
  description = "Description for the cluster"
  default     = null
}

variable "sns_topic_arn" {
  type        = string
  description = "An Amazon Resource Name (ARN) of an SNS topic to send DAX notifications to"
  default     = null
}

variable "parameter_group_name" {
  type        = string
  description = "Name of the parameter group to associate with this DAX cluster"
  default     = null
}

variable "maintenance_window" {
  type        = string
  description = "Specifies the weekly time range for when maintenance on the cluster is performed"
  default     = null
}

variable "security_group_ids" {
  type        = list(string)
  description = "One or more VPC security groups associated with the cluster"
  default     = null
}

variable "server_side_encryption" {
  type        = bool
  description = "Encrypt at rest options"
  default     = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of VPC subnet IDs for the subnet group"
}


# © 2023 Persistent Systems, <cloud-automation-stack@persistent.com>
