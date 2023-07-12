variable "context" {
  type = object({

    application_name = string
    environment_name = string

    region = string

    tags = map(string)
  })
}
variable "name" {
  type = string
}
variable "engine" {
  type    = string
  default = "docdb"
}
variable "admin_username" {
  type = string
}
variable "admin_password" {
  type = string
}
variable "skip_final_snapshot" {
  type    = bool
  default = false
}
variable "instance_count" {
  type    = number
  default = 0
}
variable "instance_class" {
  type    = string
  default = null
}
variable "kms_key_id" {
  type    = string
  default = null
}
