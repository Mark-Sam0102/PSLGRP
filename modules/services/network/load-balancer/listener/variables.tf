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

variable "load_balancer_arn" {
  type        = string
  description = "ARN of the load balancer the listener is associated with"
}

variable "port" {
  type        = string
  default     = null
  description = "Port on which the load balancer is listening"
}

variable "protocol" {
  type        = string
  default     = null
  description = "Protocol for connections from clients to the load balancer. For Application Load Balancers, valid values are HTTP and HTTPS, with a default of HTTP. For Network Load Balancers, valid values are TCP, TLS, UDP, and TCP_UDP"
}

variable "default_action_type" {
  type        = string
  description = "Type of default action routing (forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc)"
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

variable "cognito_pool_arn" {
  type        = string
  default     = null
  description = "ARN of the Cognito user pool"
}

variable "cognito_pool_client_id" {
  type        = string
  default     = null
  description = "ID of the Cognito user pool client"
}

variable "cognito_pool_domain" {
  type        = string
  default     = null
  description = "Domain prefix or fully-qualified domain name of the Cognito user pool"
}

variable "oidc_auth_endpoint" {
  type        = string
  default     = null
  description = "Authorization endpoint of the IdP"
}

variable "oidc_client_id" {
  type        = string
  default     = null
  description = "OAuth 2.0 client identifier"
}

variable "oidc_client_secret" {
  type        = string
  default     = null
  description = "OAuth 2.0 client secret"
}

variable "oidc_issuer" {
  type        = string
  default     = null
  description = "OIDC issuer identifier of the IdP"
}

variable "oidc_token_endpoint" {
  type        = string
  default     = null
  description = "Token endpoint of the IdP"
}

variable "oidc_user_info_endpoint" {
  type        = string
  default     = null
  description = "User info endpoint of the IdP"
}

variable "certificate_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) of the certificate to be used for the Listener"
  default     = null
}

variable "ssl_policy" {
  type        = string
  description = "Name of the SSL Policy for the listener. Can only be set if `protocol` is `HTTPS` or `TLS`."
  default     = null
}
