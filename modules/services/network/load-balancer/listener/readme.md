# AWS Load Balancer Listener

## Overview
This module provisions an aws lb listener resource attached to a load balancer


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
| [aws_lb_listener.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auth\_type | Type of authentication to use. Valid values are (authenticate-cognito,authenticate-oidc) | `string` | `null` | no |
| certificate\_arn | The Amazon Resource Name (ARN) of the certificate to be used for the Listener | `string` | `null` | no |
| cognito\_pool\_arn | ARN of the Cognito user pool | `string` | `null` | no |
| cognito\_pool\_client\_id | ID of the Cognito user pool client | `string` | `null` | no |
| cognito\_pool\_domain | Domain prefix or fully-qualified domain name of the Cognito user pool | `string` | `null` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| default\_action\_type | Type of default action routing (forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc) | `string` | n/a | yes |
| fixed\_response\_content\_type | Content type of the response. Valid values are text/plain, text/css, text/html, application/javascript and application/json | `string` | `null` | no |
| fixed\_response\_message\_body | Message body of the response | `string` | `null` | no |
| fixed\_response\_status\_code | HTTP response code. Valid values are 2XX, 4XX, or 5XX | `string` | `null` | no |
| load\_balancer\_arn | ARN of the load balancer the listener is associated with | `string` | n/a | yes |
| name | Name for the resource | `string` | n/a | yes |
| oidc\_auth\_endpoint | Authorization endpoint of the IdP | `string` | `null` | no |
| oidc\_client\_id | OAuth 2.0 client identifier | `string` | `null` | no |
| oidc\_client\_secret | OAuth 2.0 client secret | `string` | `null` | no |
| oidc\_issuer | OIDC issuer identifier of the IdP | `string` | `null` | no |
| oidc\_token\_endpoint | Token endpoint of the IdP | `string` | `null` | no |
| oidc\_user\_info\_endpoint | User info endpoint of the IdP | `string` | `null` | no |
| port | Port on which the load balancer is listening | `string` | `null` | no |
| protocol | Protocol for connections from clients to the load balancer. For Application Load Balancers, valid values are HTTP and HTTPS, with a default of HTTP. For Network Load Balancers, valid values are TCP, TLS, UDP, and TCP\_UDP | `string` | `null` | no |
| redirect\_host | Host to redirect to | `string` | `null` | no |
| redirect\_path | Path of url to redirect to | `string` | `null` | no |
| redirect\_port | Port to redirect to | `string` | `null` | no |
| redirect\_protocol | Redirect protocol. Valid values are HTTP, HTTPS, or #{protocol} | `string` | `null` | no |
| redirect\_query | Redirect query parameters. Do not include the leading ? | `string` | `null` | no |
| redirect\_status\_code | HTTP redirect code. The redirect is either permanent HTTP\_301 or temporary HTTP\_302 | `string` | `null` | no |
| ssl\_policy | Name of the SSL Policy for the listener. Can only be set if `protocol` is `HTTPS` or `TLS`. | `string` | `null` | no |
| target\_groups | List of target groups for the default action of the listener | <pre>list(object({<br>    arn    = string<br>    weight = number<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the provisioned listener |
| id | Id of the provisioned listener |

[comment]: # (END_TF_DOCS)