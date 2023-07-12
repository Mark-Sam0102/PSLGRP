variable "context" {
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)
  })
  description = "The context object provides important details about the environment that this resource will be deployed into"
}
variable "cluster_name" {
  type        = string
  description = "Name of the EKS Cluster"
}
variable "name" {
  type        = string
  description = "Name of EKS Node Group"
}
variable "node_role_arn" {
  type        = string
  description = "Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group."
}
variable "subnets" {
  type        = list(string)
  description = "The ID of the subnets associated with your cluster."
  default     = []
}
variable "desired_size" {
  type        = number
  description = "Desired number of worker nodes."
  default     = 1
}
variable "max_size" {
  type        = number
  description = "Maximum number of worker nodes."
  default     = 2
}
variable "min_size" {
  type        = number
  description = "Minimum number of worker nodes."
  default     = 2
}
variable "max_unavailable" {
  type        = number
  description = "Desired max number of unavailable worker nodes during node group update."
  default     = 2
}
variable "instance_type" {
  type        = string
  description = "To initialize the instance type"
  default     = "t3.medium"
}
variable "disk_size" {
  type        = number
  description = "Disk size in GB"
  default     = 20
}
variable "capacity_type" {
  type        = string
  description = "To initialize the capacity type"
  default     = "ON_DEMAND"
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>