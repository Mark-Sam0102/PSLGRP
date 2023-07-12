[comment]: # (BEGIN_TF_DOCS)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 4.40.0 |
| random | ~> 3.0.1 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 4.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_proxy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_proxy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auth | Configuration block(s) with authorization mechanisms to connect to the associated instances or clusters | <pre>list(object({<br>    secret_arn  = string<br>    description = string<br>    iam_auth    = string<br>  }))</pre> | n/a | yes |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| debug\_logging | Whether the proxy includes detailed information about SQL statements in its logs | `bool` | `false` | no |
| engine\_family | The kinds of databases that the proxy can connect to | `string` | n/a | yes |
| name | The identifier for the proxy | `string` | n/a | yes |
| observability\_settings | The observability settings object provides basic configuration that can be used to configure logging and monitoring within a module | <pre>object({<br><br>    log_group = object({<br>      name = string<br>      arn  = string<br>    })<br>    bucket = object({<br>      id  = string<br>      arn = string<br>    })<br>    cloudwatch_log_publisher_policy = object({<br>      arn = string<br>      id  = string<br>    })<br>    retention_policy = object({<br>      short_term = number<br>      long_term  = number<br>    })<br>  })</pre> | `null` | no |
| require\_tls | A Boolean parameter that specifies whether Transport Layer Security (TLS) encryption is required for connections to the proxy | `bool` | `true` | no |
| role\_arn | The Amazon Resource Name (ARN) of the IAM role that the proxy uses to access secrets in AWS Secrets Manager. | `string` | n/a | yes |
| security\_groups | One or more VPC security group IDs to associate with the new proxy | `list(string)` | n/a | yes |
| subnets | One or more VPC subnet IDs to associate with the new proxy | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | Amazon Resource Name (ARN) for the proxy |
| endpoint | Endpoint for the proxy |
| id | ID for the proxy |
| name | Name of the proxy |

[comment]: # (END_TF_DOCS)