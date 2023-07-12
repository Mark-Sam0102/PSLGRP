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
  description = "Name of Target Group"
}
variable "port" {
  type        = number
  description = "Port on which targets receive traffic"
  default     = null
}
variable "protocol" {
  type        = string
  description = "Protocol to use for routing traffic to the targets"
  default     = null
}
variable "target_type" {
  type        = string
  description = "Type of target that you must specify when registering targets with this target group"
  default     = "instance"
}
variable "vpc_id" {
  type        = string
  description = "Identifier of the VPC in which to create the target group"
  default     = null
}
variable "target_ids" {
  type        = list(string)
  description = " The ID of the target."
  default     = []
}
variable "health_check_path" {
  type        = string
  description = "The destination for the health check request."
  default     = null
}
