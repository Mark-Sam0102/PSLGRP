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
  description = "The replication task identifier."
}

variable "migration_type" {
  type        = string
  description = "The migration type. Can be one of full-load , cdc or full-load-and-cdc."
}

variable "replication_instance_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) of the replication instance."
}

variable "source_endpoint_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) string that uniquely identifies the source endpoint."
}

variable "table_mappings" {
  type        = string
  description = "An escaped JSON string that contains the table mappings."
}

variable "target_endpoint_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) string that uniquely identifies the target endpoint."
}