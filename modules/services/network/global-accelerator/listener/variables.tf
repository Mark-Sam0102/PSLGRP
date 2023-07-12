variable "accelerator_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) of your accelerator."
}

variable "client_affinity" {
  type        = string
  description = "Direct all requests from a user to the same endpoint. Valid values are NONE, SOURCE_IP. Default: NONE. If NONE, Global Accelerator uses the five-tuple properties of source IP address, source port, destination IP address, destination port, and protocol to select the hash value. If SOURCE_IP, Global Accelerator uses the two-tuple properties of source (client) IP address and destination IP address to select the hash value"
  default     = "NONE"
}

variable "protocol" {
  type        = string
  description = "The protocol for the connections from clients to the accelerator. Valid values are TCP, UDP."
  default     = null
}

variable "port_ranges" {
  type = list(object({
    source_port      = optional(number)
    destination_port = optional(number)
  }))
  description = "The list of port ranges for the connections from clients to the accelerator"
  default     = null
}

variable "endpoint_groups" {
  type = list(object({
    region                  = string
    health_check_path       = string
    health_check_port       = number
    traffic_dial_percentage = number
    endpoint_configurations = list(object({
      endpoint_id            = string
      weight                 = number
      client_ip_preservation = bool
    }))
  }))
  description = "Routes requests to one or more registered endpoints in AWS Global Accelerator. The region is AWS Region where the endpoint group is located. Traffic dial percentage is the percentage of traffic to send to an AWS Region. Additional traffic is distributed to other endpoint groups for this listener, The default value is 100.Health check port is the port that AWS Global Accelerator uses to check the health of endpoints that are part of this endpoint group. Health check path is if the protocol is HTTP/S, then this specifies the path that is the destination for health check targets. The default value is slash (/). Terraform will only perform drift detection of its value when present in a configuration. Endpoint id is the ID for the endpoint. The weight is associated with the endpoint. When you add weights to endpoints, you configure AWS Global Accelerator to route traffic based on proportions that you specify."
  default     = []
}

# © 2023 Persistent Systems, <cloud-automation-stack@persistent.com>
