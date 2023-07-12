[comment]: # (BEGIN_TF_DOCS)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 4.40.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 4.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_globalaccelerator_endpoint_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/globalaccelerator_endpoint_group) | resource |
| [aws_globalaccelerator_listener.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/globalaccelerator_listener) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| accelerator\_arn | The Amazon Resource Name (ARN) of your accelerator. | `string` | n/a | yes |
| client\_affinity | Direct all requests from a user to the same endpoint. Valid values are NONE, SOURCE\_IP. Default: NONE. If NONE, Global Accelerator uses the five-tuple properties of source IP address, source port, destination IP address, destination port, and protocol to select the hash value. If SOURCE\_IP, Global Accelerator uses the two-tuple properties of source (client) IP address and destination IP address to select the hash value | `string` | `"NONE"` | no |
| endpoint\_groups | Routes requests to one or more registered endpoints in AWS Global Accelerator. The region is AWS Region where the endpoint group is located. Traffic dial percentage is the percentage of traffic to send to an AWS Region. Additional traffic is distributed to other endpoint groups for this listener, The default value is 100.Health check port is the port that AWS Global Accelerator uses to check the health of endpoints that are part of this endpoint group. Health check path is if the protocol is HTTP/S, then this specifies the path that is the destination for health check targets. The default value is slash (/). Terraform will only perform drift detection of its value when present in a configuration. Endpoint id is the ID for the endpoint. The weight is associated with the endpoint. When you add weights to endpoints, you configure AWS Global Accelerator to route traffic based on proportions that you specify. | <pre>list(object({<br>    region                  = string<br>    health_check_path       = string<br>    health_check_port       = number<br>    traffic_dial_percentage = number<br>    endpoint_configurations = list(object({<br>      endpoint_id            = string<br>      weight                 = number<br>      client_ip_preservation = bool<br>    }))<br>  }))</pre> | `[]` | no |
| port\_ranges | The list of port ranges for the connections from clients to the accelerator | <pre>list(object({<br>    source_port      = optional(number)<br>    destination_port = optional(number)<br>  }))</pre> | `null` | no |
| protocol | The protocol for the connections from clients to the accelerator. Valid values are TCP, UDP. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name (ARN) of the listener. |
| endpoints | Global Accelerator Endpoint Group IDs and ARNs. |

[comment]: # (END_TF_DOCS)