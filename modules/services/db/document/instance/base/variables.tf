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
  description = "Name used while applying tags to the resource"
}
variable "cluster_id" {
  type        = string
  description = "The identifier of the aws_docdb_cluster in which to launch this instance."
}
variable "instance_class" {
  type        = string
  description = "The instance class to use. For details on CPU and memory"
}
