variable "application_name" {
  description = "Indicates the logical group of the resources deployed together as the 'Application' name. This is the top-level name of the resources deployed together that share a common lifecycle."
}
variable "environment_name" {
  description = "Indicates the lifecycle group of resources deployed for an Application. An 'Application' can have multiple instances deployed, each within a different position within the release 'lifecycle' (e.g. DEV, TEST, QA, STAGE, PROD)"
}
variable "added_by" {
  type        = string
  description = "Name of the user who provisioned the resources, should be provided at the deployment"
}

variable "engine_version" {
  type        = string
  default     = "14.00"
  description = "The engine version to use"
}

variable "allocated_storage" {
  type        = number
  default     = 20
  description = "The allocated storage in gigabytes"
}

variable "instance_class" {
  type        = string
  default     = "db.t3.medium"
  description = "The instance type of the RDS instance"
}
variable "PIPOD_DEPLOYMENT_ID" {
  type    = string
  default = "1"
  description = "Deployment ID"
}
variable "tags" {
  type = map
  default = null
  description = "Default tags"
}
variable "rds_name" {
  type= string
  default = "pipod-rds-mssql"
}
variable "region" {
  description = "The AWS region to use."
  default = "us-east-1"
}
variable "private_subnet_ids" {
  type = list(string)
  description = "List of public subnets Id"
  default = []
}
variable "vpc_id" {
  type = string
  description = "vpc id"
}
