variable "application_name" {
  description = "Indicates the logical group of the resources deployed together as the 'Application' name. This is the top-level name of the resources deployed together that share a common lifecycle."
  default = "PiPODEks"
}
variable "environment_name" {
  description = "Indicates the lifecycle group of resources deployed for an Application. An 'Application' can have multiple instances deployed, each within a different position within the release 'lifecycle' (e.g. DEV, TEST, QA, STAGE, PROD)"
  default = "DEV"
}
variable "added_by" {
  type        = string
  description = "Name of the user who provisioned the resources, should be provided at the deployment"
  default = "prasad"
}
variable "endpoint_private_access" {
  type        = bool
  description = "To enable the Amazon EKS private API server endpoint."
  default     = true
}
variable "endpoint_public_access" {
  type        = bool
  description = "To enable the Amazon EKS public API server endpoint."
  default     = true
}
variable "instance_type" {
  type        = string
  description = "To initialize the instance type"
  default     = "t3.large"
}
variable "disk_size" {
  type        = number
  description = "Disk size in GB"
  default     = 30
}
variable "capacity_type" {
  type        = string
  description = "To initialize the capacity type"
  default     = "SPOT"
}
variable "kubernetes_version" {
  type        = number
  description = "This is kubernetes version 1.26,1.25,1.24"
  default     = 1.25
}
variable "max_size" {
  type        = number
  description = "Maximum number of worker nodes."
  default     = 1
}
variable "min_size" {
  type        = number
  description = "Minimum number of worker nodes."
  default     = 1
}
variable "PIPOD_DEPLOYMENT_ID" {
  type    = string
  default = "1"
  description = "Deployment ID"
}
variable "cluster_name" {
  type    = string
  default = "pipodvariablename"
  description = "eks_cluster_name"
}
variable "tags" {
  type = map
  default = null
  description = "Default tags"
}
variable "public_subnet_ids" {
  type = list(string)
  description = "List of public subnets Id"
  default = []
}
variable "vpc_id" {
  type = string
  description = "vpc id"
}
# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>