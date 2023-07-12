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

variable "product_version" {
  type        = string
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
  type        = string
  description = "Deployment ID"
}

variable "tags" {
  type        = map(any)
  default     = null
  description = "Default tags"
}

variable "rds_name" {
  type = string
}

variable "region" {
  description = "The AWS region to use."
}

variable "multi_az" {
  type        = bool
  description = "Specifies if the RDS instance is multi-AZ"
  default     = true
}

variable "deletion_protection" {
  type        = bool
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true."
  default     = false
}

variable "username" {
  type        = string
  description = "Username for the master DB user"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnets Id"
  default     = []
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
}
