[comment]: # (BEGIN_TF_DOCS)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.load_balancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br>    region           = string<br>    tags             = map(string)<br>  })</pre> | n/a | yes |
| cross\_zone\_load\_balancing | To enable cross-zone load balancing. Only valid for Network load balancer | `bool` | `false` | no |
| internal | If true load balancer routes requests from clients to targets using private IP addresses | `bool` | `false` | no |
| load\_balancer\_type | The type of load balancer. Available values are application , gateway and network | `string` | n/a | yes |
| logging\_prefix | The S3 bucket prefix. Logs are stored in the root if not configured. | `string` | `null` | no |
| name | name of load balancer | `string` | n/a | yes |
| observability\_settings | The observability settings object provides basic configuration that can be used to configure logging and monitoring within a module | <pre>object({<br><br>    log_group = object({<br>      name = string<br>      arn  = string<br>    })<br>    bucket = object({<br>      id  = string<br>      arn = string<br>    })<br>    cloudwatch_log_publisher_policy = object({<br>      arn = string<br>      id  = string<br>    })<br>    retention_policy = object({<br>      short_term = number<br>      long_term  = number<br>    })<br>  })</pre> | n/a | yes |
| security\_groups | List of security group IDs for Load Balancer But security\_groups only valid for application load balancer | `list(string)` | `null` | no |
| subnets | List of subnets IDs for Load Balancer | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the load balancer |
| arn\_suffix | The ARN suffix for use with CloudWatch Metrics. |
| dns\_name | The DNS name of the load balancer. |
| id | The id of the load balancer |
| zone\_id | The canonical hosted zone ID of the load balancer |

[comment]: # (END_TF_DOCS)