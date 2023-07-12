variable "name" {
  type        = string
  description = "Resource name"
}

variable "retention_policy" {
  type = object({
    short_term = number
    long_term  = number
  })
  description = "Retains your configuration items for that specified period"
}
