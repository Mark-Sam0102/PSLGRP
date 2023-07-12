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
  description = "Name for the resource"
}

variable "listener_arn" {
  type        = string
  description = "ARN of the associated listener"
}

variable "priority" {
  type        = number
  default     = null
  description = "The priority for the rule between 1 and 50000"
}

# Action block variables
variable "action_type" {
  type        = string
  description = "Type of action routing (forward, redirect, fixed-response)"
}

variable "auth_type" {
  type        = string
  default     = null
  description = "Type of authentication to use. Valid values are (authenticate-cognito,authenticate-oidc)"
}

variable "target_groups" {
  type = list(object({
    arn    = string
    weight = number
  }))

  default     = []
  description = "List of target groups for the default action of the listener"
}

variable "stickiness" {
  type        = bool
  default     = false
  description = "Indicates whether target group stickiness is enabled"
}

variable "stickiness_duration" {
  type        = number
  default     = null
  description = "The time period, in seconds, during which requests from a client should be routed to the same target group. The range is 1-604800 seconds"
}

variable "redirect_status_code" {
  type        = string
  default     = null
  description = "HTTP redirect code. The redirect is either permanent HTTP_301 or temporary HTTP_302"
}

variable "redirect_host" {
  type        = string
  default     = null
  description = "Host to redirect to"
}

variable "redirect_path" {
  type        = string
  default     = null
  description = "Path of url to redirect to"
}

variable "redirect_port" {
  type        = string
  default     = null
  description = "Port to redirect to"
}

variable "redirect_protocol" {
  type        = string
  default     = null
  description = "Redirect protocol. Valid values are HTTP, HTTPS, or #{protocol}"
}

variable "redirect_query" {
  type        = string
  default     = null
  description = "Redirect query parameters. Do not include the leading ?"
}

variable "fixed_response_content_type" {
  type        = string
  default     = null
  description = "Content type of the response. Valid values are text/plain, text/css, text/html, application/javascript and application/json"
}

variable "fixed_response_message_body" {
  type        = string
  default     = null
  description = "Message body of the response"
}

variable "fixed_response_status_code" {
  type        = string
  default     = null
  description = "HTTP response code. Valid values are 2XX, 4XX, or 5XX"
}

variable "cognito_data" {
  type = object({
    user_pool_arn       = string
    user_pool_client_id = string
    user_pool_domain    = string
  })

  default     = null
  description = "Input values required to configure cognito authentication(cognito pool arn, cognito pool client id, and cognito pool domain name)"
}

variable "oidc_data" {
  type = object({
    authorization_endpoint = string
    client_id              = string
    client_secret          = string
    issuer                 = string
    token_endpoint         = string
    user_info_endpoint     = string
  })

  default     = null
  description = "Input values required to configure oidc authentication(auth endpoint, client id and secret, issuer, token and user info endpoint)"
}

# Condition block 
variable "conditions" {
  type = list(object({
    host_header = object({
      values = list(string)
    })

    http_header = object({
      http_header_name = string
      values           = list(string)
    })

    http_request_method = object({
      values = list(string)
    })

    path_pattern = object({
      values = list(string)
    })

    query_string = object({
      key   = string
      value = string
    })

    source_ip = object({
      values = list(string)
    })

  }))
  description = "List of conditions for the listener rule"
}
