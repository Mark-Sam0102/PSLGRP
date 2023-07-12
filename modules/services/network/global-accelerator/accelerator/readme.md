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
| [aws_globalaccelerator_accelerator.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/globalaccelerator_accelerator) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br>    region           = string<br>    tags             = map(string)<br>  })</pre> | n/a | yes |
| enabled | Indicates whether the accelerator is enabled | `bool` | `true` | no |
| ip\_address\_type | The value for the address type | `string` | `"IPV4"` | no |
| name | The name of the accelerator | `string` | n/a | yes |
| observability\_settings | The observability settings object provides basic configuration that can be used to configure logging and monitoring within a module | <pre>object({<br><br>    log_group = object({<br>      name = string<br>      arn  = string<br>    })<br>    bucket = object({<br>      id  = string<br>      arn = string<br>    })<br>    cloudwatch_log_publisher_policy = object({<br>      arn = string<br>      id  = string<br>    })<br>    retention_policy = object({<br>      short_term = number<br>      long_term  = number<br>    })<br>  })</pre> | `null` | no |
| prefix | The prefix for the location in the Amazon S3 bucket for the flow logs | `string` | `"flow-logs/"` | no |

## Outputs

| Name | Description |
|------|-------------|
| dns\_name | The DNS name of the accelerator |
| id | The Amazon Resource Name (ARN) of the accelerator |
| ip\_sets | IP address set associated with the accelerator |

[comment]: # (END_TF_DOCS)