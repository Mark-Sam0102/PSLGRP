variable "name_prefix" {
  type        = string
  description = "Name of the resource"
}
variable "log_group_name" {
  type        = string
  description = " Name of the log group to associate the metric filter with"
}
variable "metric_namespace" {
  type        = string
  description = "The destination namespace of the CloudWatch metric"
}
