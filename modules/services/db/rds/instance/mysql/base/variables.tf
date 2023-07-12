
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
  description = "The name of the RDS instance."
}
variable "db_name" {
  type        = string
  description = "Name used while applying tags to the resource"
  default     = null
}
# https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
variable "engine_version" {
  type        = string
  description = "The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7"
}
variable "instance_class" {
  type        = string
  default     = "db.t2.small"
  description = "The instance type of the RDS instance."
}
variable "username" {
  type        = string
  description = "Username for the master DB user. "
}
variable "password" {
  type        = string
  description = "Password for the master DB user."
}
variable "subnets" {
  type        = list(string)
  description = "list of subnets"
}
variable "parameters" {
  type        = map(string)
  description = "A list of DB parameters to apply."
  default     = {}
}
variable "security_groups" {
  type        = list(string)
  description = "List of VPC security groups to associate."
  default     = null
}
variable "multi_az" {
  type        = bool
  description = "Specifies if the RDS instance is multi-AZ"
  default     = false
}
variable "allocated_storage" {
  type        = number
  description = "The allocated storage in gibibytes."
}
# gp2 | io1
variable "storage_type" {
  type        = string
  description = "One of .standard' (magnetic), 'gp2. (general purpose SSD), or .io1. (provisioned IOPS SSD). The default is .io1. if iops is specified, .gp2. if not."
  default     = "gp2"
}
variable "iops" {
  type        = number
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of .io1..e"
  default     = null
}
variable "backup_retention_period" {
  type        = number
  description = "Name used while applying tags to the resource"
  default     = 30
}
variable "availability_zone" {
  type        = string
  description = "The AZ for the RDS instance."
  default     = null
}
variable "skip_final_snapshot" {
  type        = bool
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
  default     = true
}
variable "replicate_source_db" {
  type        = string
  description = "Specifies that this resource is a Replicate database, "
  default     = null
}

variable "deletion_protection" {
  type        = bool
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true."
  default     = true
}
