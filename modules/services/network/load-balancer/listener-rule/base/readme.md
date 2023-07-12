# AWS Load Balancer Listener Rule

## Overview
This module provisions an aws lb listener rule resource attached to a load balancer listener


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
| [aws_lb_listener_rule.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| action\_type | Type of action routing (forward, redirect, fixed-response) | `string` | n/a | yes |
| auth\_type | Type of authentication to use. Valid values are (authenticate-cognito,authenticate-oidc) | `string` | `null` | no |
| cognito\_data | Input values required to configure cognito authentication(cognito pool arn, cognito pool client id, and cognito pool domain name) | <pre>object({<br>    user_pool_arn       = string<br>    user_pool_client_id = string<br>    user_pool_domain    = string<br>  })</pre> | `null` | no |
| conditions | List of conditions for the listener rule | <pre>list(object({<br>    host_header = object({<br>      values = list(string)<br>    })<br><br>    http_header = object({<br>      http_header_name = string<br>      values           = list(string)<br>    })<br><br>    http_request_method = object({<br>      values = list(string)<br>    })<br><br>    path_pattern = object({<br>      values = list(string)<br>    })<br><br>    query_string = object({<br>      key   = string<br>      value = string<br>    })<br><br>    source_ip = object({<br>      values = list(string)<br>    })<br><br>  }))</pre> | n/a | yes |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| fixed\_response\_content\_type | Content type of the response. Valid values are text/plain, text/css, text/html, application/javascript and application/json | `string` | `null` | no |
| fixed\_response\_message\_body | Message body of the response | `string` | `null` | no |
| fixed\_response\_status\_code | HTTP response code. Valid values are 2XX, 4XX, or 5XX | `string` | `null` | no |
| listener\_arn | ARN of the associated listener | `string` | n/a | yes |
| name | Name for the resource | `string` | n/a | yes |
| oidc\_data | Input values required to configure oidc authentication(auth endpoint, client id and secret, issuer, token and user info endpoint) | <pre>object({<br>    authorization_endpoint = string<br>    client_id              = string<br>    client_secret          = string<br>    issuer                 = string<br>    token_endpoint         = string<br>    user_info_endpoint     = string<br>  })</pre> | `null` | no |
| priority | The priority for the rule between 1 and 50000 | `number` | `null` | no |
| redirect\_host | Host to redirect to | `string` | `null` | no |
| redirect\_path | Path of url to redirect to | `string` | `null` | no |
| redirect\_port | Port to redirect to | `string` | `null` | no |
| redirect\_protocol | Redirect protocol. Valid values are HTTP, HTTPS, or #{protocol} | `string` | `null` | no |
| redirect\_query | Redirect query parameters. Do not include the leading ? | `string` | `null` | no |
| redirect\_status\_code | HTTP redirect code. The redirect is either permanent HTTP\_301 or temporary HTTP\_302 | `string` | `null` | no |
| stickiness | Indicates whether target group stickiness is enabled | `bool` | `false` | no |
| stickiness\_duration | The time period, in seconds, during which requests from a client should be routed to the same target group. The range is 1-604800 seconds | `number` | `null` | no |
| target\_groups | List of target groups for the default action of the listener | <pre>list(object({<br>    arn    = string<br>    weight = number<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the provisioned listener rule |
| id | Id of the provisioned listener rule |

[comment]: # (END_TF_DOCS)