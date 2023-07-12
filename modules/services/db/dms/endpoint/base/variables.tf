variable "context" {
  description = "The context object provides important details about the environment that this resource will be deployed into."
  type = object({
    application_name = string
    environment_name = string
    tags             = map(string)
  })
}

variable "name" {
  description = "The database endpoint identifier"
  type        = string
}

variable "engine_name" {
  description = "The type of engine for the endpoint"
  type        = string
}

variable "certificate_name" {
  description = "The certificate identifier"
  type        = string
  default     = null
}

variable "pem_file" {
  description = "The contents of the .pem X.509 certificate file for the certificate"
  type        = string
  default     = null

}

variable "type" {
  description = "The type of endpoint."
  type        = string
}

variable "password" {
  description = "The password to be used to login to the endpoint database."
  type        = string
}

variable "username" {
  description = "The user name to be used to login to the endpoint database."
  type        = string
}

variable "server_name" {
  description = "The host name of the server"
  type        = string
}

variable "port" {
  description = "The port used by the endpoint database"
  type        = number
}
