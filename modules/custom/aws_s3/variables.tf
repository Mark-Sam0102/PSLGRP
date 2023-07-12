variable "PIPOD_DEPLOYMENT_ID" {
  type        = string
  description = "Deployment ID"
}

variable "tags" {
  type        = map
  default     = null
  description = "Default tags"
}
